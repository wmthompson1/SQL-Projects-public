Work In Process (WIP) Journals




# Work In Process (WIP) Journals

The Work In Process Journal contains a listing of the summary transactions created by the Costing Utilities as a result of processing inventory transactions and labor tickets to work orders. These are issues (or returns) of materials and posting of labor to work orders during the period.

## Quick TOC

- [Overview](#overview)
- [How Distributions Are Created](#how-distributions-are-created)
- [Multiple Distributions / Period Behavior](#multiple-distributions--period-behavior)
- [Labor & Burden Treatment](#labor-and-burden-treatment)
- [Material Burden & Negative On-hand Handling](#material-burden--negative-on-hand-handling)
- [GL Posting / Interface Notes](#gl-posting--interface-notes)
- [Examples & User-defined Help](#examples--user-defined-help)

## Overview

Each work order that has material issued (or returned) to it or labor entered for it during the period is examined for its current value. The actual value of a work order comes entirely from inventory transactions and labor tickets. Any existing distributions that have been posted are deducted from the current value and the difference is made into a new distribution for the work order.

## How Distributions Are Created

Distributions are summary journal transactions produced by the Costing Utilities. They aggregate inventory issues and labor for each work order and prepare amounts that are ready to post to the General Ledger.

## Multiple Distributions / Period Behavior

If an order spans multiple periods or Costing Utilities are run multiple times, multiple distributions may be created. Unposted transactions for the period being processed are removed and replaced with up-to-date transactions.

## Labor and Burden Treatment

The value that VISUAL determines for labor and burden in this journal are absorbed labor and burden. Absorbed labor and burden are temporarily placed in work in process inventory, ultimately flowing to finished goods inventory, and then finally to cost of goods sold.

## Material Burden & Negative On-hand Handling

Material burden is applied when material is issued to a work order. If an issue drives on-hand quantity negative, only the quantity actually on hand is costed immediately; additional quantity is costed in the next Costing Utilities run when receipts exist (FIFO basis).

## GL Posting / Interface Notes

Posted distributions move to the General Ledger via the Post Manufacturing Journals function; WIP accounts, burden, and labor posting depend on interface setup and fallback account rules.

## Examples & User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.md) User-defined Help