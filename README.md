nginx-website Cookbook
=================
This cookbook configures nginx to serve PHP websites.
Websites configuration is held in "websites" data bags. Each databag should contain the following keys:

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>hostname</tt></td>
    <td>String</td>
    <td>Hostname of the server</td>
    <td>default.dev</td>
  </tr>
  <tr>
    <td><tt>name</tt></td>
    <td>String</td>
    <td>Short name of the website (for naming directories etc.)</td>
    <td>default</td>
  </tr>
  <tr>
    <td><tt>root</tt></td>
    <td>String</td>
    <td>Root directory of website (where index.php is located)</td>
    <td>/var/www/html/default</td>
  </tr>
  <tr>
    <td><tt>type</tt></td>
    <td>String</td>
    <td>Type of php interpreter (php-fpm or hhvm)</td>
    <td>php-fpm</td>
  </tr>
  <tr>
    <td><tt>ssl_enabled</tt></td>
    <td>Boolean</td>
    <td>Should SSL be enabled on this website. See note below. </td>
    <td>false</td>
  </tr>
</table>

Usage
-----

#### nginx-website::default
Just include `nginx-website` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[nginx-website]"
  ]
}
```

And add any number of databags in "websites" databags folder. Example:
```json
{
  "hostname": "example.com",
  "name": "example",
  "root": "/var/www/html/default/public",
  "type": "php-fpm",
  "ssl_enabled": false
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
