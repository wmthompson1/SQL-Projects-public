Understanding Price Book Concepts




# Understanding Price Book Concepts

Price Book integrates seamlessly with VISUAL and other
Infor Global Solutions products, as well as third party ERP software
solutions. The integration between Price Book and your ERP software
takes place through an open COM interface. You use formulas and various
matrices to determine the actual price within VPB.

## Estimates and Orders

Different contexts require product pricing. Often, you price parts
individually, such as in a catalog. In most cases, however, a document, such as an estimate,
order, or shopping cart provides the context for pricing. Price Book
uses documents extensively when determining combination pricing.

Price Book receives price requests from the documents throughout
the document creation process, allowing order entry personnel to be
notified immediately if there is a special price or promotion in order
to reach the maximum opportunity to up-sell select items.

## Pricing and Commission Inputs

Price Book receives, from the document being produced, various factors
or inputs that influence pricing. These factors include

* Part ID
* Product Code
* Commodity Code
* Market
* Customer Type
* Customer
* Ship-to
* Quantity
* Order Date
* Accumulated sales
* Sales Representative

## Pricing and Commission Outputs

Based on the input factors, Price Book generates the following output
values for each document:

1. Unit price
2. Trade discount percent
3. Commission percent

Unit price, trade discount percent, and commission percent values
apply to each part and line.

## Formulas

Price Book derives pricing from various pricing formulas, regardless
of how simple or complex the pricing model. Formulas implement the
business logic of pricing and are responsible for converting price
inputs to price output values.

Price Book uses the Microsoft Active Script Object or Visual Basic
Script for formula input, facilitating the integration with VE or
any other COM-based applications. You cannot only view the formula-defined
variables or document inputs, but you have access to the application
into which you are integrating VPB.

Often, more than one price formula applies to a single document.
VPB allows you to set up rules that would determine the best price
rule for the document. You can also rank the formulas into priorities.

## Matrices

There are two types of matrices in Price Book: Price/Discount, and
Commissions.

* Price Matrix stores prices
  and discounts, and is used for Markups and Costs.
* Commissions Matrix indicates
  the percentages used for sales commissions. It is held separately
  in the database from the Price/Discount values.

Price Book stores actual prices and discounts in a series of matrices,
including:

1. Unit Price
2. Unit Cost
3. Discount
4. Markup
5. Markdown

## Effectivity

Price Book supports effectivity for pricing, terms, and commissions.
Effectivity determines the dates between which the price, terms, or
commissions may be applied. Formulas also support effectivity dates.

## Pricing Alerts

Often, during order entry, it is important to know of pricing opportunities,
such as increased discounts, promotional prices, etc. Price Book alerts
you to these pricing opportunities through a series of messages.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Price_Book.htm) User-defined Help