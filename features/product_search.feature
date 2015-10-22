# encoding: UTF-8

Feature: Product search in Walmart's virtual store
 This feature allows a customer to search for a product in the e-commerce.
 
  
Scenario Outline: Search for a product in the Walmart's virtual store
  Given a test case "<tc_id>"
  
  Given I go to Walmart's virtual store
  
  When I search for a product with the following description
      | product_name   |
      | <product_name> |
  
  * I shall check the search has returned results

  When I go to the page of the choosen product

  * I shall check the page of the choosen product was correctly loaded

  When I add the choosen product to cart

  Then I shall check the choosen product "<product_name>" was correctly added to cart

Examples:
| tc_id  |  product_name   |
| TC_001 |  tv             |


Scenario Outline: Search for a nonexistent product in the Walmart's virtual store

 Given a test case "<tc_id>"
  
 Given I go to Walmart's virtual store
  
  When I search for a product with the following description
      | product_name   |
      | <product_name> |

  Then customer shall receive the message "<message>"

  Examples:
    | tc_id  |  product_name                                            | message                            |
    | TC_002 |  dashgdhgasdugasdhjasgjdasjgdjgasdgjasgdashdgagjdgjas    | não encontramos nenhum resultado   |