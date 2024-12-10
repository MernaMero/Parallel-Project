import tkinter as tk
from tkinter import messagebox
import threading

# Function to clear the window and display ATM GUI content
def ATMgui(window):
    clear_window(window)
    tk.Label(window, text="ATM Interface", font=("Arial", 20)).pack(pady=50)
    tk.Button(window, text="Back to Main", command=lambda: create_main_gui(window)).pack()

# Function to clear the window and display Admin GUI content
def AdminGui(window):
    clear_window(window)
    tk.Label(window, text="Admin Interface", font=("Arial", 20)).pack(pady=50)
    tk.Button(window, text="Back to Main", command=lambda: create_main_gui(window)).pack()

# Function to clear all widgets from the window
def clear_window(window):
    for widget in window.winfo_children():
        widget.destroy()

# Function to create the main GUI with two buttons
def create_main_gui(window):
    clear_window(window)
    window.title("ATM Simulator")
    window.geometry("700x650")

    # Heading
    tk.Label(window, text="Welcome to ATM Simulator", font=("Arial", 24)).pack(pady=50)

    # ATM Button
    tk.Button(window, text="ATM", font=("Arial", 18), width=10, command=lambda: ATMgui(window)).pack(pady=20)

    # Admin Button
    tk.Button(window, text="Admin", font=("Arial", 18), width=10, command=lambda: AdminGui(window)).pack(pady=20)

# Function to run the GUI in a separate thread
def run_gui():
    root = tk.Tk()
    create_main_gui(root)
    root.mainloop()

# Main entry point
if __name__ == "__main__":
    gui_thread = threading.Thread(target=run_gui)
    gui_thread.start()
