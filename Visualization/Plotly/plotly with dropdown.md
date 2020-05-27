- Dropdown 로직은 모든 trace를 figure에 올린 후 dropdown을 통해 보고 싶은 trace를 선택하는 로직
- `update_layout(updatemenus[dict(buttons=list([dict(label="{이름}", method="{방식}", args=[{"visible":[True or False....}...])])])` 형태로 Dropdown 설정
- `args`에서 `visible` 에 대한 `True, False` 튜플값을 입력하여 원하는 trace만 선택토록 함

```python
#!/usr/bin/env python
# coding: utf-8

import os
import pandas as pd
import re
from datetime import datetime
import ctypes


workspace = r'\\retkrso-nt0001\common\Business Information_Common\KPI files'
store_dir = [i for i in os.listdir(workspace) if bool(re.match('^[0-9]+', i)) ]
file_list = []
get_time_period = input("FY20 trend to be reported by date(yymmdd): ")
try:
    get_time_period = datetime.strptime(get_time_period, '%y%m%d')
except ValueError:
    get_time_period = input("Please check the input format(yymmdd): ")
    get_time_period = datetime.strptime(get_time_period, '%y%m%d')
print()
print('trend by 2020 week{}'.format(get_time_period.isocalendar()[1]))
print()
color_scheme = {'total':['#0269d6', '#3ea1ef', '#8ed5ff'],
                '373 Store':['#b75ed3', '#dc85e8', '#ffaeff'],
                '522 Store':['#780000', '#be6b52', '#ffc7b0'],
                '582 Store':['#d32f26', '#f08a75', '#ffd7cd'],
                '602 Store':['#ffad35', '#ffbf64', '#ffd08e'],
                '539 Store':['#106d08', '#5fb04c', '#a5f78e'],
                '373 PaOP':['#ff7272', '#ffa3a0', '#f7d1cf'],
               }


for sto in store_dir:
    file_name = sto[:3]
    file_list.append(
        r'{workspace}\{store}\FY20\{file}'.format(
            workspace=workspace,
            store=sto,
            file='{} Store KPI FY20.xlsx'.format(file_name)
        )
    )
    if sto[:3]=='373':
        file_list.append(
            r'{workspace}\{store}\FY20\{file}'.format(
                workspace=workspace,
                store=sto,
                file='{} PaOP KPI FY20.xlsx'.format(file_name)
            )
        )
    



def read_data(excel):
    
    tmp_compile = re.compile(r"[0-9]* [A-z]* KPI")
    tmp_loc = (tmp_compile.search(excel).span()[0], tmp_compile.search(excel).span()[1]-4)
    tmp_sto = excel[tmp_loc[0]:tmp_loc[1]]
    
    if tmp_sto =='539 Store':
        tmp = pd.read_excel(excel, sheet_name = "TOTAL Store KPI (weekly)").iloc[2:, [1,2,10,28,39, 40, 41, 42]]
    else:
        tmp = pd.read_excel(excel, sheet_name = "Store KPI (weekly)").iloc[2:, [1,2,10,28,39, 40, 41, 42]]
    
    tmp.columns = ['week', 'date', 'visitor', 'customer', 'sales_ly', 'sales_budget', 'sales_forecast', 'sales_ty']
    tmp['sto'] = tmp_sto
    #tmp = tmp[tmp.all(axis=1)]
    tmp = tmp[~tmp.week.isna()]
    
    return tmp

def join_sales(excel_list):
    
    tmp = pd.DataFrame()
    n=1

    for excel in excel_list:
        tmp = pd.concat([tmp, read_data(excel)])
        print('data crawling finished on {n}/{t}...'.format(n=n, t=len(excel_list)))
        n += 1
    
    print()
    print('data crawling finished!')
    print('rendering sales trend chart...')
    tmp = tmp.reset_index(drop=True)
    
    return tmp 


outcome = join_sales(file_list)
outcome = outcome[outcome.date<get_time_period]
df = outcome.loc[:,['sto', 'date', 'sales_ly', 'sales_budget', 'sales_forecast', 'sales_ty']]
df_total=df.groupby('date', as_index=False).sum()


import plotly.graph_objects as go
fig = go.Figure()
fig.add_trace(
    go.Scatter(x= df_total.date,
               y=df_total.sales_ty*1000,
               mode='lines+markers',
               line=dict(color=color_scheme['total'][0]),
               name = 'Sales(FY20)')
)

fig.add_trace(
    go.Scatter(x= df_total.date[1:],
               y=df_total.sales_ly[1:]*1000,
               visible=False,
               line=dict(dash='dash', color=color_scheme['total'][1]),
               name = 'Sales(FY19)')
)

fig.add_trace(
    go.Scatter(x= df_total.date,
               y=df_total.sales_budget*1000,
               visible=False,
               line=dict(dash='dash', color=color_scheme['total'][2]),
               name = 'Sales(budget)')
)


for sto in file_list:
    tmp_compile = re.compile(r"[0-9]* [A-z]* KPI")
    tmp_loc = (tmp_compile.search(sto).span()[0], tmp_compile.search(sto).span()[1]-4)
    sto_n = sto[tmp_loc[0]:tmp_loc[1]]


    fig.add_trace(
        go.Scatter(#x= df[df.sto==sto_n].date,
                   #y=df[df.sto==sto_n].sales_ty*1000,
                   x= df[(df.sto==sto_n)&(df.sales_ty>0)].date,
                   y= df[(df.sto==sto_n)&(df.sales_ty>0)].sales_ty*1000,
                   mode='lines+markers',
                   name = '{}'.format(sto_n),
                   line=dict(color=color_scheme['{}'.format(sto_n)][0])
                  )
    )
    
    fig.add_trace(
        go.Scatter(#x= df[df.sto==sto_n].date,
                   #y=df[df.sto==sto_n].sales_budget*1000,
                   x= df[(df.sto==sto_n)&(df.sales_budget>0)].date,
                   y= df[(df.sto==sto_n)&(df.sales_budget>0)].sales_budget*1000,
                   mode='lines+markers',
                   visible=False,
                   name = '{} budget'.format(sto_n),
                   line=dict(dash='dash', color=color_scheme['{}'.format(sto_n)][2])
                  )
    )
    
    fig.add_trace(
        go.Scatter(#x= df[df.sto==sto_n].date[1:],
                   #y=df[df.sto==sto_n].sales_ly[1:]*1000,
                   x= df[(df.sto==sto_n)&(df.sales_ly>0)].date[1:],
                   y= df[(df.sto==sto_n)&(df.sales_ly>0)].sales_ly[1:]*1000,
                   mode='lines+markers',
                   name = '{} FY19'.format(sto_n),
                   visible=False,
                   line=dict(dash='dash', color=color_scheme['{}'.format(sto_n)][1])
                  )
    )   



fig.update_layout(
    updatemenus=[
        dict(
            active=0,
            buttons=list([
                dict(label="Overview",
                     method="update",
                     args=[{"visible": [True, False, False]*(len(file_list)+1)},
                           {"title": "Weekly sales"}]),
                dict(label="Country level",
                     method="update",
                     args=[{"visible": [True]*3 + [False]*3*len(file_list)},
                           {"title": "Weekly sales - Country"}]),
                dict(label="Store level",
                     method="update",
                     args=[{"visible": [False]*3 + [True, False, False]*len(file_list)},
                           {"title": "Weekly sales - Store"}]),
                
                dict(label="373",
                     method="update",
                     args=[{"visible": [False]*3 + [True]*6 + [False]*3*(len(file_list)-1)},
                           {"title": "Weekly sales - 373"}]),
                dict(label="522",
                     method="update",
                     args=[{"visible": [False]*3*(len(file_list)-3) + [True]*3 + [False]*3*(len(file_list)-1)},
                           {"title": "Weekly sales - 522"}]),
                dict(label="539",
                     method="update",
                     args=[{"visible": [False]*3*(len(file_list)-2) + [True]*3 + [False]*3*(len(file_list)-2)},
                           {"title": "Weekly sales - 539"}]),
                dict(label="582",
                     method="update",
                     args=[{"visible": [False]*3*(len(file_list)-1) + [True]*3 + [False]*3*(len(file_list)-3)},
                           {"title": "Weekly sales - 582"}]),
                dict(label="602",
                     method="update",
                     args=[{"visible": [False]*3*(len(file_list)) + [True]*3 + [False]*3*(len(file_list)-4)},
                           {"title": "Weekly sales - 602"}])
                
                
            ]),
        )
    ])


fout_name = ''.join([os.getcwd(),'/Weekly sales trend(w{}).html'.format(get_time_period.isocalendar()[1])])
fig.write_html(fout_name)
os.startfile(fout_name)
os.startfile(os.getcwd())
ctypes.windll.user32.MessageBoxW(0, "process finished", "report generating", 0)
```

reference.

https://plotly.com/python/dropdowns/
