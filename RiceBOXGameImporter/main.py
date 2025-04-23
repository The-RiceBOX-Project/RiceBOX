import tkinter
from tkinter import ttk
from tkinter import filedialog
from tkinter import messagebox
import RBImporter

exec_path = ""
icon_path = ""
data_folder_path = ""
game_name = ""
game_description = ""
authors = ""
version = ""


def select_executable():
    global exec_path
    _exec_path = filedialog.askopenfilename()
    if _exec_path:
        exec_path = _exec_path
        exec_path_label.config(text=exec_path)

def select_icon():
    global icon_path
    _icon_path = filedialog.askopenfilename()
    if _icon_path:
        icon_path = _icon_path
        icon_path_label.config(text=icon_path)

def select_data_folder():
    global data_folder_path
    _data_folder_path = filedialog.askdirectory()
    if _data_folder_path:
        data_folder_path = _data_folder_path
        data_folder_path_label.config(text=data_folder_path)

def generate():
    game_name = name_entry.get()
    game_description = description_entry.get()
    authors = authors_entry.get()
    version = version_entry.get()

    if exec_path and icon_path and game_name and game_description and authors and version:
        RBImporter.create_folder(game_name)
        RBImporter.generate_manifest_json(game_name, game_description, authors, version)
        RBImporter.put_icon(game_name, icon_path)
        RBImporter.put_exec(game_name, exec_path)
    if data_folder_path:
        RBImporter.put_data_folder(game_name, data_folder_path)
    
    messagebox.showinfo("RiceBOX Game Port Generator", "Game ported successfully")

top = tkinter.Tk()
top.title("RiceBOX Game Port Generator")
top.resizable(False, False)
top.geometry("500x500")

exec_select_button = ttk.Button(text="Select Executable", command=select_executable)
exec_select_button.pack(pady=(10,0))

exec_path_label = ttk.Label(text="No file selected")
exec_path_label.pack()

icon_select_button = ttk.Button(text="Select icon", command=select_icon)
icon_select_button.pack(pady=(10,0))

icon_path_label = ttk.Label(text="No file selected")
icon_path_label.pack()

data_folder_select_button = ttk.Button(text="Select Datafolder(if needed)", command=select_data_folder)
data_folder_select_button.pack(pady=(10,0))

data_folder_path_label = ttk.Label(text="No folder selected")
data_folder_path_label.pack()

name_label = ttk.Label(text="Game Name:")
name_label.pack(pady=(10,0))

name_entry = ttk.Entry()
name_entry.pack()

description_label = ttk.Label(text="Game Description:")
description_label.pack(pady=(10,0))

description_entry = ttk.Entry()
description_entry.pack()

authors_label = ttk.Label(text="Game Author(s):")
authors_label.pack(pady=(10,0))

authors_entry = ttk.Entry()
authors_entry.pack()

version_label = ttk.Label(text="Game Version:")
version_label.pack(pady=(10,0))

version_entry = ttk.Entry()
version_entry.pack()

submit_button = ttk.Button(text="Generate Port", command=generate)
submit_button.pack(pady=(20, 0))

top.mainloop()