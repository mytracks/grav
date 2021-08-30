This container image contains [Grav](https://getgrav.org) running with PHP 8.0 served by [Symfony](https://symfony.com).

The _user_ folder has to be mounted to `/grav/user`. Let's assume your _users_ files are stored in folder _grav-files_. Then you can start the container like this:

```sh
docker run -d -p 8080:8080 -v ./grav-files:/grav/user mytracks/grav:1.7.0
```

The webserver is exposed on port 8080.
