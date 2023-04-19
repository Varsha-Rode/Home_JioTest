import pyautogui
from robot.api.deco import keyword

@keyword('Press Button')
def send_keys(str):
    pyautogui.press(str)


@keyword('Close Application Pop-up')
def press_escape_key():
    pyautogui.press('escape')


@keyword('Get List Length')
def get_list_length(list):
    count = 0
    for element in list:
        count += 1
    return count
