## Installation

* **docker build -t simple_wep_app .**

## RUN

* **docker run -d -p 5000:5000 simple_wep_app**
* **docker run -e "ENV=DEV" -d -p 5000:5000 simple_web_app**

## Notes

* **-d: to run in backdround**
* **-p 5000:5000: t tells Docker we want to forward port 5000 in the container to port 5000 on the host.**

> **Additional useful flags**
* **--rm: remove container after stoping it**
* **--name <name_container>: add name for container**

## Testing

* **curl localhost:5000**
> * Output: Hello World!

## Deployment

* **cd ../deploy**
* **docker build -t deploy_flask .**
* **cd ../simple_web_app**
* **docker compose -f prod-mode.yml up**
