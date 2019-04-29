# LegendsBrowser Container

This Dockerfile is a simple containerization of the [LegendsBrowser](https://github.com/robertjanetzko/LegendsBrowser) app created by [@robertjanetzko](https://github.com/robertjanetzko).  LegendsBrowser allows you to view your [DwarfFortress](http://www.bay12games.com/dwarves/) world's legends and histories in your browser.

To use, run the container with Docker or [Podman](https://podman.io/), mapping port 8080 to whatever port you wish to use for accessing the legends browser, and mounting you DwarfFortress directory to /legends inside the container.  Pass the legends.xml file you wish to use as the argument to the `docker` or `podman` command.

For example:

```
# Assuming your legends.xml file is titled: region5-00251-08-16-legends.xml

docker run -it \
           -p 8080:8080 \
           -v /path/to/dwarffortress:/legends:ro \
           region5-00251-08-16-legends.xml
```

Then navigate in your browser to http://localhost:8080/ to view your world.


