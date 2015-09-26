nginx-website Cookbook
=================
This cookbook configures nginx to serve PHP websites.
Websites configuration is held in data bags in folder named in `node['nginx-website']['bag']` (default folder name is: "websites").
The recipe will iterate through all data bag files and set up a website for each of them.

Each data bag should contain the following keys:

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Example</th>
  </tr>
  <tr>
    <td><tt>hostname</tt></td>
    <td>String</td>
    <td>Hostname of the server</td>
    <td>myproject.dev</td>
  </tr>
  <tr>
    <td><tt>name</tt></td>
    <td>String</td>
    <td>Short name of the website (for naming directories etc.)</td>
    <td>myproject</td>
  </tr>
  <tr>
    <td><tt>root</tt></td>
    <td>String</td>
    <td>Root directory of website (where index.php is located)</td>
    <td>/var/www/html/myproject/public</td>
  </tr>
  <tr>
    <td><tt>php_type</tt></td>
    <td>String</td>
    <td>Type of connection to php engine:
      <ul>
        <li>tcpip - (default) connects to 127.0.0.1:9000 (use this for HHVM)</li>
        <li>tcpip-no-keep-conn - connects to 127.0.0.1:9000 with fastcgi_keep_conn = off</li>
        <li>phpfpm-socket - connects to php-fpm socket</li>
      </ul>
    </td>
    <td></td>
  </tr>
  <tr>
    <td><tt>ssl_enabled</tt></td>
    <td>Boolean</td>
    <td>Should SSL be enabled on this website.</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>ssl_certificate (required if ssl is enabled)</tt></td>
    <td>String</td>
    <td>Certificate string (look out to properly excape special characters in json)</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>ssl_certificate_key (required if ssl is enabled)</tt></td>
    <td>String</td>
    <td>Certificate string (look out to properly excape special characters in json)</td>
    <td></td>
  </tr>
</table>

Usage
-----

#### nginx-website::default
Just include `nginx-website` in your `run_list`:

```json
{
  (...)
  "run_list": [
    "recipe[nginx-website]"
  ]
}
```

And add any number of databags in "websites" databags folder. Example file `example.json`:
```json
{
  "id": "example",
  "hostname": "example.com",
  "name": "example",
  "root": "/var/www/html/example/public",
  "type": "phpfpm-socket",
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
