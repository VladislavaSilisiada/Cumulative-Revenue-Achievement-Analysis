SELECT date,
       SUM(run_revenue) / SUM(run_predict) * 100 AS percent
FROM (
    SELECT date,
           SUM(predict) OVER (ORDER BY date) AS run_predict,
           SUM(revenue) OVER (ORDER BY date) AS run_revenue
    FROM (
        SELECT date, SUM(predict) AS predict,
                     SUM(revenue) AS revenue
        FROM (
            SELECT date, predict, 0 AS revenue
            FROM `DA.revenue_predict`
           
            UNION ALL
           
            SELECT date, 0 AS predict, SUM(p.price) AS revenue
            FROM `DA.product` p
            JOIN `DA.order` oo ON oo.item_id = p.item_id
            JOIN `DA.session` o ON oo.ga_session_id = o.ga_session_id
            GROUP BY date
        ) AS union_
        GROUP BY date
    ) AS union_2
) AS run
GROUP BY date;
