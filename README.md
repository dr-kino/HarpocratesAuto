# HarpocratesAuto
Autohotkey script to interact with KeePass Database.

## Usage

1. Type the following hotstring:
```c
pswd@haa+<TAB>
```
or
```c
pswd@hab+<TAB>
```

2. A command prompt will open, then type the database master key:
```c
1234567890
```

<img src="https://github.com/dr-kino/HarpocratesAuto/blob/main/Images/HapocratesAuto.gif"/>

## Personalization
To personalize it, edit the [HarpocratesAuto.ahk](https://github.com/dr-kino/HarpocratesAuto/blob/main/HarpocratesAuto.ahk) file changing the path for your own database, composite key and password title ([HarpocratesAuto.kdbx](https://github.com/dr-kino/HarpocratesAuto/blob/main/Database/HarpocratesAuto.kdbx), [HarpocratesAuto.key](https://github.com/dr-kino/HarpocratesAuto/blob/main/Database/HarpocratesAuto.key) and HarpocratesAuto_A title).

## Dependencies
[AutoHotKey](https://www.autohotkey.com/) - Tested Version: V2 Alpha

[KeyPass](https://keepass.info/) - Tested Version: 2.46

[KPScript](https://keepass.info/help/v2_dev/scr_sc_index.html) - Tested Version: 2.46 (Note: KPScript shall be at the same version of KeePass)

## Notes

Master key: Change your master key periodically.

Two-factor protection: A key file is something that you must have in order to be able to open the database (in contrast to a master password, which you must know). If you use both a key file and a master password, you have a two-factor protection: possession and knowledge.

Location: As mentioned above, the idea of a key file is that you have something. If an attacker obtains both your database file and your key file, then the key file provides no protection. Therefore, the two files must be stored in different locations. For example, you could store the key file on a separate USB stick.
