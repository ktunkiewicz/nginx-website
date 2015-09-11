nginx_website Cookbook
=================
This cookbook configures nginx to serve website.

Attributes
----------

#### nginx_website::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['nginx_website']['hostname']</tt></td>
    <td>String</td>
    <td>Hostname of the server</td>
    <td><tt>default.dev</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx_website']['name']</tt></td>
    <td>String</td>
    <td>Name of the project</td>
    <td><tt>default</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx_website']['root']</tt></td>
    <td>String</td>
    <td>Root directory of project</td>
    <td><tt>/var/www/html</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx_website']['public']</tt></td>
    <td>String</td>
    <td>Public directory of the project (with preceding "/")</td>
    <td><tt>/public</tt></td>
  </tr>
</table>

Usage
-----

The website `index.php` (or `index.html`) file should be placed in a directory named: `<root><name><public>`.
So for the default values that would be: `/var/www/html/default/public/index.php`

#### nginx_website::default
Just include `nginx_website` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[nginx_website]"
  ]
}
```

And defined it's variables somewhere:
```json
{
  "nginx_website": {
    "hostname": "example.com",
    "name": "example",
    "root": "/var/www/html",
    "public": "/public"
  }
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Submit a Pull Request using Github

License and Authors
-------------------
Author: Kamil Tunkiewicz
Licence: MIT
