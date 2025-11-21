---Необходимо разделить анализы на группы по розничной цене:
---1 — самые дорогие анализы по розничной цене, 4 — самые дешевые анализы по розничной цене.

---таблица assay:
---id_an - идентификатор анализа (PK)  
---name - название анализа  
---id_type - тип анализа 
---preanalysis - требуется ли специальная преаналитика
---id_cat_an - идентификатор категории
---cost_price - закупочная цена 
---selling_price - розничная цена
---term - температурный режим 
---info - дополнительная информация 




select id_an, name, selling_price,
        ntile(4) over(order by selling_price DESC) as selling_price_quartile 
from assay
order by id_an