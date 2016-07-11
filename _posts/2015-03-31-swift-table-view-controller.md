---
layout: post
---

Today I learned how to build a simple iOS list app using `UITableViewController`:

![](/til/img/table-view.gif)

The exciting part of the code is in my view controller.

I first define a variable to hold some arbitrary data:

{% raw %}
let players:[String] = ["Jesse","Arjun","Jessica"]
{% endraw %}

And in the table view method:
{% raw %}
override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
  var goodOrBad = indexPath.row % 2 == 0 ? "good" : "bad"
  let cell = tableView.dequeueReusableCellWithIdentifier(goodOrBad, forIndexPath: indexPath) as UITableViewCell
  cell.textLabel?.text = players[indexPath.row]
  cell.detailTextLabel?.text = goodOrBad
  return cell
}
{% endraw %}

The table view method feels a bit like looping through rows of mysql. The ternary operator just alternates
"good" and "bad" for each row of the table cell detail label.
