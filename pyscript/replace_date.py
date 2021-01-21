import bs4
from datetime import datetime as dt
from datetime import date
from dateutil.relativedelta import relativedelta

target_html = 'index.html'

today = dt.today()
year = today.year
month = today.month
day = today.day

with open(target_html, mode='r') as f:
    html = f.read()

soup = bs4.BeautifulSoup(html, 'html.parser')

new_tag = soup.new_tag('p', attrs={'id': 'update_date'})
new_tag.string = f'最終更新日：{year}年{month}月{day}日'
soup.find('p', id="update_date").replace_with(new_tag)

with open(target_html, mode='w') as f:
    f.write((soup.prettify(formatter='html5')))

print(f'{year}/{month}/{day}')

new_tag = soup.new_tag('p', attrs={'id': 'birthday'})
age = relativedelta(today, date(1993, 8, 25)).years + 1
new_tag.string = f'{age}歳'
soup.find('p', id="birthday").replace_with(new_tag)
