from __future__ import annotations

import collections
from pathlib import Path

from extract_uiscreen import parse_file
from generate_classic_animations import qualified_names

ROOT = Path(__file__).resolve().parents[1]
SCREENS = (
    "inGameChallengeHud",
    "inGameChallengeBackground",
    "inGameChallengeScoreScreen",
    "inGameChallengeScoreScreenComplete",
    "inGameChallengeScoreScreenCompleteFailure",
    "inGameChallengeInstructionsScreen",
    "inGameChallengeMapScreen",
)

for stem in SCREENS:
    source = ROOT / "assets_raw/xml/screens" / f"{stem}.uiscreen"
    report = parse_file(source)
    names = qualified_names(report["components"])
    animations = [(name, animation["name"])
                  for name, component in zip(names, report["components"])
                  for animation in component["animations"]]
    tracks = collections.Counter(track["name"]
                                 for component in report["components"]
                                 for animation in component["animations"]
                                 for track in animation["tracks"])
    interpolations = collections.Counter(key["interpolation"]
                                         for component in report["components"]
                                         for animation in component["animations"]
                                         for track in animation["tracks"]
                                         for key in track["keyframes"])
    print(f"\n{stem}: {len(names)} components, {len(animations)} animations")
    print(f"  tracks={dict(tracks)} interpolations={dict(interpolations)}")
    print(f"  root={names[0]!r} animations={animations}")
