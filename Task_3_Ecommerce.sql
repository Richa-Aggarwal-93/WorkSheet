 -- Use Database master
 use master;

 -- select all column from amazon table 
 Select *
 from amazon$;

 -- Find product name where rating is below 2
 Select product_name, rating_count, rating
 from amazon$
 where rating <= 2;

 -- Find product name where discount percentage is below 0.2
 Select product_name, discounted_price, discount_percentage
 from amazon$
 where discount_percentage <= 0.2;

 Select product_name, rating_count, rating
 from amazon$
 where rating <= 3;

 -- Find no. of category and product name
 Select product_name,category
 from amazon$
 group by category, product_name;

 --find unique category
 select distinct category
 from amazon$;

 --Find unique product name
 select distinct product_name
 from amazon$;

 Select category,product_name
 from amazon$
 group by category, product_name
 order by category;

 -- use case statement when condition is applied
 Select product_id, product_name, case when rating <= 3 then 'Unsatisfy' else 'satisfy' end as rating_status
 into rating_table_1
 from amazon$;

 select *
 from rating_table_1;

 -- Find top 10 product name
 Select top 10 product_name
 from amazon$
 order by rating;

 --Inner join on similar column product name
 select r.product_name
 from amazon$ a inner join rating_table_1 r
 on a.[product_name] = r.[product_name];
 
 
 --Highest rating product name and category using subquery
 select product_name, rating, category
 from amazon$
 where rating = (select MAX (rating) from amazon$);

 --Second Highest rating Using subquery
 select MAX(rating)
 from (select*
 from amazon$
 where rating <> (select MAX (rating) from amazon$)
 ) as second_highest_rating_product;
  
  -- --Second and others Highest rating  product name and category Using subquery
  select MAX(rating)as sec_rating, product_name, category
 from (select*from amazon$ where rating <> (select MAX (rating) from amazon$)
 ) as second_highest_rating_product
 group by product_name, category
 order by sec_rating desc;

 -- Overall average rating 
 select AVG(rating) as average
 from amazon$;

 --INDEX
 Create index serial_no
 on amazon$ (product_name)
;


