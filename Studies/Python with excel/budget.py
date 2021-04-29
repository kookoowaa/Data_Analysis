import pandas as pd
from tkinter import filedialog
from tkinter import messagebox

# 엑셀 불러오기
strBalance = filedialog.askopenfilename(initialfile = 'C:/Users/chpar10/IKEA/SO Business Navigation (RETKRSO) - Documents/Local_reports/01. Profit and loss/FY21/BrowseBalances.xlsx')
if strBalance == "":
    strBalance = 'C:/Users/chpar10/IKEA/SO Business Navigation (RETKRSO) - Documents/Local_reports/01. Profit and loss/FY21/BrowseBalances.xlsx'
dfOpen = pd.read_excel(strBalance)

# 전처리
df1 = dfOpen.iloc[:-1].melt(id_vars=['Account', 'Element 3', 'Element 4', 'Element 5'], value_vars=dfOpen.columns[-13:-1])
df1.columns = ['account', 'unit', 'CC', 'el5', 'period', 'value']
df1 = df1.dropna( subset=["CC"])
df1.account = df1.account.astype('int64')
df1.period = df1.period.replace("Period ", "", regex=True)

# 불필요한 CC 제거
idx = [not i for i in df1.CC.str.startswith("CC8", na=False)]
df1 = df1[idx]
idx = [not i for i in df1.CC.str.startswith("CC9", na=False)]
df1 = df1[idx]
idx = [not i for i in df1.CC.str.startswith("CC3010", na=False)]
df1 = df1[idx]
idx = [not i for i in df1.CC.str.startswith("CC3090", na=False)]
df1 = df1[idx]

# Food/Store 구분
df1["function"] = ["Food" if i else "Store" for i in df1.CC.str.startswith("CC39", na=False)]
# Sales 값 reverse
df1.value = df1.apply(lambda r: -r[5] if r[0]<4000 else r[5], axis=1)
df1 = df1.reset_index(drop=True)

# 동부산 작업
df1a = df1[df1.unit!='STO602']
df1b = df1[df1.unit=='STO602']
idx = df1b.el5.str.contains("SA[0-9]+", regex=True, na=False).to_list()
tmp_cc = []
for i in range(df1b.shape[0]):
    if idx[i]:
        tmp_cc.append(df1b.el5.iloc[i].replace("SA", "CC"))
    else:
        tmp_cc.append(df1b.CC.iloc[i])
df1b.CC = tmp_cc
df2 = pd.concat([df1a,df1b]).reset_index(drop=True)

# 마무리
df2.to_excel('out.xlsx', index=False)
messagebox.showinfo(title="Crawling", message="Process finished")