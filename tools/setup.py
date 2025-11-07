#!/usr/bin/env python3

import os
import subprocess
from prompt_toolkit.shortcuts import radiolist_dialog
from prompt_toolkit.styles import Style

def main():
    """
    This script provides a TUI for selecting and running setup scripts.
    """
    
    dir = os.getenv("INSTALL_SCRIPT_DIR", "0")
    assert(dir is not "0")
    print(f"{dir}")
    
    # Make sure scripts are executable
    subprocess.run([f"{dir}/tools/make_executable.sh"], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    scripts = []
    for root, _, files in os.walk(f"{dir}/setup/"):
        for file in files:
            if file.endswith(".sh"):
                scripts.append(os.path.join(root, file))
    scripts.sort()

    if not scripts:
        print("Keine Skripte gefunden.")
        exit(1)

    choices = [(script, os.path.basename(script)) for script in scripts]
    choices.insert(0, ("all", "Alle ausführen"))
    choices.append(("exit", "Beenden"))

    style = Style.from_dict({
        'dialog': 'bg:#88ff88',
        'dialog frame.label': 'bg:#ffffff #000000',
        'dialog.body': 'bg:#000000 #00ff00',
        'dialog shadow': 'bg:#003300',
    })

    selected_script = radiolist_dialog(
        title="Setup Skript Auswahl",
        text="Bitte wähle ein Skript zum Ausführen aus:",
        values=choices,
        style=style
    ).run()

    if selected_script is None or selected_script == "exit":
        print("Setup abgebrochen.")
        exit(0)

    if selected_script == "all":
        print("Führe alle Skripte aus...")
        for script in scripts:
            print(f"Führe {os.path.basename(script)} aus...")
            subprocess.run([f".{script}"], check=True)
    else:
        print(f"Führe {os.path.basename(selected_script)} aus...")
        subprocess.run([f".{selected_script}"], check=True)

    print("Setup abgeschlossen.")

if __name__ == "__main__":
    main()