#!/usr/bin/env python3
"""Checks the UI texts: the keys the code uses against Resources/Languages/en.json, and every translation against
en.json (missing and extra keys, placeholders that differ, invalid JSON).

  tools/check_strings.py            # from the project folder; exit status 1 when something is wrong

A key is a quoted string of lowercase words joined by dots ("status.saved", "upload.log.failed"); the code passes
them to T(), or to a method that does (AddFontRow).
"""
import json, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
LANGS = os.path.join(ROOT, "Resources", "Languages")
KEY = re.compile(r'"([a-z][a-zA-Z0-9]*(?:\.[a-zA-Z0-9]+)+)"')
PLACEHOLDER = re.compile(r"\{(\w+)\}")
NOT_KEYS = {"CharSets.txt", "Blocks.txt"}  # quoted file names that look like keys


def code_keys():
    used = {}
    for name in sorted(os.listdir(ROOT)):
        if not name.endswith((".xojo_code", ".xojo_window", ".xojo_menu")):
            continue
        with open(os.path.join(ROOT, name), encoding="utf-8") as f:
            for lineno, line in enumerate(f, 1):
                if line.lstrip().startswith("//") or "#tag" in line:
                    continue
                for key in KEY.findall(line):
                    if key not in NOT_KEYS and not key.endswith((".mfp", ".json", ".txt", ".otf", ".ttf")):
                        used.setdefault(key, f"{name}:{lineno}")
    return used


def load(path):
    try:
        with open(path, encoding="utf-8") as f:
            return json.load(f)
    except (OSError, ValueError) as e:
        print(f"{os.path.basename(path)}: {e}")
        return None


def main():
    problems = 0
    en = load(os.path.join(LANGS, "en.json"))
    if en is None:
        return 1
    used = code_keys()
    for key, where in sorted(used.items()):
        if key not in en:
            print(f"en.json: no {key} (used at {where})")
            problems += 1
    for key in sorted(k for k in en if not k.startswith("_") and k not in used):
        print(f"en.json: {key} isn't used by the code")
        problems += 1
    for name in sorted(os.listdir(LANGS)):
        if not name.endswith(".json") or name == "en.json":
            continue
        tr = load(os.path.join(LANGS, name))
        if tr is None:
            problems += 1
            continue
        for key in sorted(set(en) - set(tr)):
            print(f"{name}: no {key} (English is used)")
            problems += 1
        for key in sorted(set(tr) - set(en)):
            print(f"{name}: {key} isn't in en.json")
            problems += 1
        for key in sorted(set(en) & set(tr)):
            a, b = set(PLACEHOLDER.findall(en[key])), set(PLACEHOLDER.findall(tr[key]))
            if a != b:
                print(f"{name}: {key} has placeholders {sorted(b)}, en.json {sorted(a)}")
                problems += 1
    print(f"{len(used)} keys used, {len(en) - 1} in en.json: " + ("OK" if not problems else f"{problems} problems"))
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main())
