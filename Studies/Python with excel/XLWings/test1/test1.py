import xlwings as xw
import pandas as pd

def main():
    wb = xw.Book.caller()
    sheet = wb.sheets[0]
    sheet["A1"].value =  pd.DataFrame([[1,2,3],['a','b','c']], index=False)


@xw.func
def hello(name):
    return f"Hello {name}!"


if __name__ == "__main__":
    xw.Book("test1.xlsm").set_mock_caller()
    main()
