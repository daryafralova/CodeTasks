---Определить, сколько потратил в 2005 году каждый из членов семьи. В результирующей выборке не выводите тех членов семьи, которые ничего не потратили.

SELECT sum(amount * unit_price) costs,
	member_name,
	status
from payments
	inner join familymembers on payments.family_member = familymembers.member_id
where YEAR(PAYMENTS.DATE) = 2005
group by member_name,
	status