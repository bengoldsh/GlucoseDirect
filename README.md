# Glucose Direct

**Warning, This project is highly experimental. Please use this app with caution and extreme care.
Do not mindlessly make decisions based on software.
Do not use this software if you are unsure.**

App programmed in Swift/SwiftUI for using Libre 1/2 blood glucose sensors. I try to keep the code as readable and understandable as possible so that as many people as possible can understand how this part of diabetes management works.

## Current features
- Libre 2 EU support (without transmitter)
- Libre 1 support with transmitter (supported transmitter bubble)
- Libre 1, manual scans without transmitter
- Add manual bgm values
- Manage bgm/cgm values
- Units mg/dL or mmol/L
- Upload glucose values to Nightscout
- Upload sensor start to Nightscout
- FreeAPS X support (with Shared App Groups)
- Calendar export (to support Apple Watch)
- Glucose read aloud
- Glucose badge
- Glucose chart
- Glucose trend arrow
- Glucose change per minute
- Factory calibration
- Custom calibration
- Lifetime details
- Transmitter details
- Sensor details
- Glucose alert for lows and highs
- Connection lost alert
- Missed readings alert
- Sensor expiring alert
- Snooze for glucose alerts
- Loop (Workspace, dev branch) support, [Loop CGM Manager](https://github.com/creepymonster/GlucoseDirectClient)

## Available languages
- English
- ![zh-CN translation](https://img.shields.io/badge/dynamic/json?color=blue&label=zh-CN&style=flat-square&query=%24.progress.10.data.translationProgress&url=https%3A%2F%2Fbadges.awesome-crowdin.com%2Fstats-14414316-488303-update.json) Chinese (simplified)
- ![zh-TW translation](https://img.shields.io/badge/dynamic/json?color=blue&label=zh-TW&style=flat-square&query=%24.progress.11.data.translationProgress&url=https%3A%2F%2Fbadges.awesome-crowdin.com%2Fstats-14414316-488303-update.json) Chinese (traditional)
- ![fi translation](https://img.shields.io/badge/dynamic/json?color=blue&label=fi&style=flat-square&query=%24.progress.2.data.translationProgress&url=https%3A%2F%2Fbadges.awesome-crowdin.com%2Fstats-14414316-488303-update.json) Finnish
- ![de translation](https://img.shields.io/badge/dynamic/json?color=blue&label=de&style=flat-square&query=%24.progress.0.data.translationProgress&url=https%3A%2F%2Fbadges.awesome-crowdin.com%2Fstats-14414316-488303-update.json) German
- ![it translation](https://img.shields.io/badge/dynamic/json?color=blue&label=it&style=flat-square&query=%24.progress.4.data.translationProgress&url=https%3A%2F%2Fbadges.awesome-crowdin.com%2Fstats-14414316-488303-update.json) Italian
- ![pt-PT translation](https://img.shields.io/badge/dynamic/json?color=blue&label=pt-PT&style=flat-square&query=%24.progress.6.data.translationProgress&url=https%3A%2F%2Fbadges.awesome-crowdin.com%2Fstats-14414316-488303-update.json) Portuguese
- ![ru translation](https://img.shields.io/badge/dynamic/json?color=blue&label=ru&style=flat-square&query=%24.progress.7.data.translationProgress&url=https%3A%2F%2Fbadges.awesome-crowdin.com%2Fstats-14414316-488303-update.json) Russian
- ![es-ES translation](https://img.shields.io/badge/dynamic/json?color=blue&label=es-ES&style=flat-square&query=%24.progress.1.data.translationProgress&url=https%3A%2F%2Fbadges.awesome-crowdin.com%2Fstats-14414316-488303-update.json) Spanish
- ![sv translation](https://img.shields.io/badge/dynamic/json?color=blue&label=sv&style=flat-square&query=%24.progress.8.data.translationProgress&url=https%3A%2F%2Fbadges.awesome-crowdin.com%2Fstats-14414316-488303-update.json) Swedish
- ![tr translation](https://img.shields.io/badge/dynamic/json?color=blue&label=tr&style=flat-square&query=%24.progress.9.data.translationProgress&url=https%3A%2F%2Fbadges.awesome-crowdin.com%2Fstats-14414316-488303-update.json) Turkish
- ![fr translation](https://img.shields.io/badge/dynamic/json?color=blue&label=fr&style=flat-square&query=%24.progress.3.data.translationProgress&url=https%3A%2F%2Fbadges.awesome-crowdin.com%2Fstats-14414316-488303-update.json) French
- ![nl translation](https://img.shields.io/badge/dynamic/json?color=blue&label=nl&style=flat-square&query=%24.progress.5.data.translationProgress&url=https%3A%2F%2Fbadges.awesome-crowdin.com%2Fstats-14414316-488303-update.json) Dutch

## Requirements
- Apple iPhone with iOS 15

## Quick test?
You can quickly get an idea of Libre Direct: [TestFlight](https://testflight.apple.com/join/dWDt5Wme)

## Frequently Asked Questions
Read the [FAQ](FAQ.md) ☺️

## Feedback?
I am very happy to receive feedback - suggestions for improvement or reports of bugs encountered.

## Support?
- I appreciate all the translations I get. Just drop by Crowdin, every translation helps :) https://crwd.in/glucose-direct-app

## Thank you all hardworking translators for your great work ❤️
birdfly, Diabetlum, Fcourela, goldshotter, keyzersemen, Timmy_otoole, evr, JBM_, Mrzurgon, albertodeviaje2, HellsCrimson, georgin303, eyesoganci, mrfrostt, ferdytao, jjerbstein, Bmwmax73, Kobe24, CrazySugarNL, immatexeira, anton-tony_v, Bubblan, yinojiang

## Todo
- Cache Nightscout uploads without an Internet connection and run them later
- Transmitter battery notifications
- Upload sensor end to nightscout
- Other transmitters
- Other diabetes sources to upload to (like tidepool, ...)

## Screenshots
![Screenshot](/Screenshots/overview.png?raw=true)
![Screenshot](/Screenshots/list.png?raw=true)
![Screenshot](/Screenshots/calibrations.png?raw=true)
![Screenshot](/Screenshots/settings.png?raw=true)

## I use sounds from the following sources (incl. licenses):
_Source:_ https://freesound.org/people/SpliceSound/sounds/369848
_Author:_ SpliceSound
_License:_ CC0 1.0 Universal, http://creativecommons.org/publicdomain/zero/1.0/

_Source:_ https://freesound.org/people/JavierZumer/sounds/257227
_Author:_ JavierZumer
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/JavierZumer/sounds/257235
_Author:_ JavierZumer
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/LorenzoTheGreat/sounds/417791
_Author:_ LorenzoTheGreat
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/LittleRobotSoundFactory/sounds/270329/
_Author:_ LittleRobotSoundFactory
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/LittleRobotSoundFactory/sounds/270327/
_Author:_ LittleRobotSoundFactory
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/LittleRobotSoundFactory/sounds/270323/
_Author:_ LittleRobotSoundFactory
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/LittleRobotSoundFactory/sounds/270319/
_Author:_ LittleRobotSoundFactory
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/LittleRobotSoundFactory/sounds/270330/
_Author:_ LittleRobotSoundFactory
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/LittleRobotSoundFactory/sounds/270305/
_Author:_ LittleRobotSoundFactory
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/LittleRobotSoundFactory/sounds/270304/
_Author:_ LittleRobotSoundFactory
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/ProjectsU012/sounds/341629/
_Author:_ ProjectsU012
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/ProjectsU012/sounds/334261/
_Author:_ ProjectsU012
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/ProjectsU012/sounds/360964/
_Author:_ ProjectsU012
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/ProjectsU012/sounds/333785/
_Author:_ ProjectsU012
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/TannerSound/sounds/478262/
_Author:_ TannerSound
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/andersmmg/sounds/511491/
_Author:_ andersmmg
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/shinephoenixstormcrow/sounds/337050/
_Author:_ shinephoenixstormcrow
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/soneproject/sounds/346425/
_Author:_ soneproject
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/ying16/sounds/353069/
_Author:_ ying16
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/queenoyster/sounds/582986/
_Author:_ queenoyster
_License:_ CC0 1.0 Universal, http://creativecommons.org/publicdomain/zero/1.0/

_Source:_ https://freesound.org/people/walkingdistance/sounds/185197/
_Author:_ walkingdistance
_License:_ Attribution 3.0 Unported, http://creativecommons.org/licenses/by/3.0/

_Source:_ https://freesound.org/people/melokacool/sounds/613653
_Author:_ melokacool
_License:_ CC0 1.0 Universal, http://creativecommons.org/publicdomain/zero/1.0/
