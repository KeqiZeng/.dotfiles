#!/usr/bin/env python3
import os
import random

theme_dir = os.path.expanduser("~/.config/kitty/themes")

themes = [f for f in os.listdir(theme_dir) if f.endswith(".conf")]

if themes:
    random_theme = random.choice(themes)
    theme = os.path.splitext(os.path.basename(random_theme))[0]
    os.environ["THEME"] = theme
    os.environ["BAT_THEME"] = theme
    os.environ["YAZI_THEME"] = theme.lower()
    print(f"include {os.path.join(theme_dir, random_theme)}")
