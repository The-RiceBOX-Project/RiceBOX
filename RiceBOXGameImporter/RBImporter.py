import json
import os
import shutil

def create_folder(game_name):
    dir_name = game_name.replace(" ", "_")
    os.makedirs(dir_name, exist_ok=True)

def generate_manifest_json(game_name, game_description, authors, version):
    dir_name = game_name.replace(" ", "_")
    manifest = {
        "name": game_name,
        "description": game_description,
        "authors": authors,
        "version": version
    }

    with open(dir_name + "/manifest.json", "w") as f:
        json.dump(manifest, f, indent=4)

def put_icon(game_name, icon_path):
    dir_name = game_name.replace(" ", "_")
    shutil.copyfile(icon_path, dir_name + "/icon.png")

def put_exec(game_name, exec_path):
    dir_name = game_name.replace(" ", "_")
    shutil.copyfile(exec_path, dir_name + "/exec")

def put_data_folder(game_name, folder_path):
    dir_name = game_name.replace(" ", "_")
    shutil.copy(folder_path, dir_name)