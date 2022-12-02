athena


select userid,action,timestamp,category,payload
from prod_useractivity.bi_collection
where ( year = 2021 and (month=11 or month=12))
and teamid!='team5ca64605696924.59748857'
and (action='Not-A-Fit'  or action='Good-Fit' or action = 'Click-Reason-Of-Not-A-Fit')
and (category='SearchResults-Selected-Candidates' or category='Search-Results' or category='Profile-Page')


select userid,action,timestamp,category,payload
from prod_useractivity.bi_collection
where ((year=2021 and (month=11 or month=12)) or (year=2022 and (month=1) ))
and teamid!='team5ca64605696924.59748857'
and (action='Not-A-Fit'  or action='Good-Fit' or action = 'Click-Reason-Of-Not-A-Fit')
and (category='SearchResults-Selected-Candidates' or category='Search-Results' or category='Profile-Page')