SELECT 
  CONCAT(a.topping_name, ',', b.topping_name, ',', c.topping_name) AS pizza,
  a.ingredient_cost + b.ingredient_cost + c.ingredient_cost AS total_cost
FROM pizza_toppings AS a
INNER JOIN pizza_toppings AS b
  ON a.topping_name < b.topping_name

INNER JOIN pizza_toppings AS c
  ON b.topping_name < c.topping_name 
ORDER BY total_cost DESC, pizza;
