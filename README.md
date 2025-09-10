# [arajczy/nagios](https://github.com/arajczy/docker-nagios)

![Docker Image Size (tag)](https://img.shields.io/docker/image-size/arajczy/nagios/latest?logo=docker)
![Docker Pulls](https://img.shields.io/docker/pulls/arajczy/nagios?logo=docker)
[![GitHub License](https://img.shields.io/github/license/arajczy/docker-nagios?logo=github&color=750014)](https://github.com/arajczy/docker-nagios/blob/trunk/LICENSE)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/arajczy/docker-nagios/trunk?logo=github)](https://github.com/arajczy/docker-nagios/commits/trunk)
[![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/arajczy/docker-nagios/build-and-publish.yml?logo=github)](https://github.com/arajczy/docker-nagios/pkgs/container/nagios)
[![GitHub issues](https://img.shields.io/github/issues/arajczy/docker-nagios?logo=github)](https://github.com/arajczy/docker-nagios/issues/new/choose)

[Nagios Core](https://www.nagios.org/projects/nagios-core/) serves as the basic event scheduler, event processor, and alert manager for elements that are monitored. It features several APIs that are used to extend its capabilities to perform additional tasks, is implemented as a daemon written in C for performance reasons, and is designed to run natively on Linux/\*nix systems.

## Components

|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Product / Latest | Installed |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | --------: |
|         [![Nagios Core](https://img.shields.io/github/v/release/NagiosEnterprises/nagioscore?logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEiIHdpZHRoPSIyNiIgaGVpZ2h0PSIyNiI+PHBhdGggZD0iTS4wMDEgMjQuMTcxYTIuODkgMi44OSAwIDAgMSAzLjAyOS0xLjM2N2MyLjc2LjMgNS41NDcuMjg0IDguMzA0LS4wNS45MDYtLjEyIDEuODIzLS4xMjYgMi43My0uMDJsNC4yNDQuMzVhOS4zMyA5LjMzIDAgMCAxIDEuMy4xODMuOTIuOTIgMCAwIDEgLjc2OS43MjEuOS45IDAgMCAxLS41MTIgMS4wMTQgMi42NyAyLjY3IDAgMCAxLTEuMjMuMzUzbC00LjU2LS4yMTZhMzMuOTUgMzMuOTUgMCAwIDAtMy45NDUuMTEyYy0xLjgxNS4xOC0zLjY0NC4xOTItNS40Ni4wMzQtMS4wMDctLjA4OC0yLjAyNy0uMDMyLTMuMDQtLjA1YTEuNzcgMS43NyAwIDAgMS0xLjYzLS42NnpNMjAuMzM3IDYuMTU3bC4xNSAzLjQ1MmExNy4yMyAxNy4yMyAwIDAgMS0uMDcgMi4yMyAxNi41MiAxNi41MiAwIDAgMCAwIDQuNjU4Yy4wOTUuNjcuMDc0IDEuMzUtLjA2IDIuMDEzYTEuNzMgMS43MyAwIDAgMS0xLjkwOCAxLjYwNmMtMS4xMTQtLjA2LTIuMjItLjIyMi0zLjMwNC0uNDgyYTMuMzkgMy4zOSAwIDAgMS0xLjg5NC0xLjQ3MyAyMS4xMSAyMS4xMSAwIDAgMS0xLjIzLTEuOTg0Yy0uNjQyLTEuMTk2LTEuNDMzLTIuMzA2LTIuMzUzLTMuMzA0LS41NC0uNjUtMS4wMjctMS4zNC0xLjQ2Mi0yLjA2MmE0LjI1IDQuMjUgMCAwIDAtLjMyMS0uNTE3LjY5LjY5IDAgMCAwLTEuMjE0LjIzIDIuNDQgMi40NCAwIDAgMC0uMTI3LjgwM2wtLjEgNC42N2EyLjI4IDIuMjggMCAwIDEtLjE3NS43ODcgMi4xNiAyLjE2IDAgMCAwLS4wNDcgMS45NDcuNzguNzggMCAwIDEtLjU2MiAxLjEyNCA0LjY0IDQuNjQgMCAwIDEtMy41NjQtLjFjLS42MTQtLjI1LTEuMDEtLjg1LTEtMS41MTNsLS4xMi0zLjM1NGMtLjA3My0uNjk2LjE5Mi0xLjM4Ni43MTMtMS44NTQuMjI0LS4yMDcuNDE1LS40NDcuNTY3LS43MTIuMzQ1LS41LjMyMy0xLjE1LS4wNTMtMS42MTZBNi4zNSA2LjM1IDAgMCAxIC45NjggNi4wMTRsLjA3NS0zLjM0Ni4wMDgtLjgxM0ExLjAxIDEuMDEgMCAwIDEgMi4zNDYuNzE1YTcuMDEgNy4wMSAwIDAgMCAyLjQ4LS40NjMgMS41IDEuNSAwIDAgMSAyLjA1OS45MTZjLjEyOC4yNzYuMjI2LjU2NS4zNC44NDhhMS43IDEuNyAwIDAgMCAxLjAyNiAxLjA2MkEyLjQzIDIuNDMgMCAwIDEgOS40NiA0LjExOWwzLjE4OCA0LjU5NGE3Ljk3IDcuOTcgMCAwIDAgMS4xMjQgMS4zMDljLjQ1NS40MTMuODMyLjI4NC45MDYtLjM0MmExNC44MyAxNC44MyAwIDAgMCAuMTM1LTIuOTMzIDMyLjgzIDMyLjgzIDAgMCAxIC4wNTEtNC41NjJjLS4wOTgtLjUyLjA4LTEuMDUyLjQ3LTEuNDA4YTEuNTIgMS41MiAwIDAgMSAxLjQ0NS0uMzM4bDEuMTI0LjA2NGEyLjE3IDIuMTcgMCAwIDEgMi4yNjIgMS44MDEgNS44OSA1Ljg5IDAgMCAxIC4yMDIgMS4zMDFsLjAxIDIuNTQzenoiIGZpbGw9IiNmZmZmZmYiLz48L3N2Zz4K&label=Nagios%20Core)](https://github.com/NagiosEnterprises/nagioscore) |     4.5.9 |
| [![Nagios Plugins](https://img.shields.io/github/v/release/nagios-plugins/nagios-plugins?logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEiIHdpZHRoPSIyNiIgaGVpZ2h0PSIyNiI+PHBhdGggZD0iTS4wMDEgMjQuMTcxYTIuODkgMi44OSAwIDAgMSAzLjAyOS0xLjM2N2MyLjc2LjMgNS41NDcuMjg0IDguMzA0LS4wNS45MDYtLjEyIDEuODIzLS4xMjYgMi43My0uMDJsNC4yNDQuMzVhOS4zMyA5LjMzIDAgMCAxIDEuMy4xODMuOTIuOTIgMCAwIDEgLjc2OS43MjEuOS45IDAgMCAxLS41MTIgMS4wMTQgMi42NyAyLjY3IDAgMCAxLTEuMjMuMzUzbC00LjU2LS4yMTZhMzMuOTUgMzMuOTUgMCAwIDAtMy45NDUuMTEyYy0xLjgxNS4xOC0zLjY0NC4xOTItNS40Ni4wMzQtMS4wMDctLjA4OC0yLjAyNy0uMDMyLTMuMDQtLjA1YTEuNzcgMS43NyAwIDAgMS0xLjYzLS42NnpNMjAuMzM3IDYuMTU3bC4xNSAzLjQ1MmExNy4yMyAxNy4yMyAwIDAgMS0uMDcgMi4yMyAxNi41MiAxNi41MiAwIDAgMCAwIDQuNjU4Yy4wOTUuNjcuMDc0IDEuMzUtLjA2IDIuMDEzYTEuNzMgMS43MyAwIDAgMS0xLjkwOCAxLjYwNmMtMS4xMTQtLjA2LTIuMjItLjIyMi0zLjMwNC0uNDgyYTMuMzkgMy4zOSAwIDAgMS0xLjg5NC0xLjQ3MyAyMS4xMSAyMS4xMSAwIDAgMS0xLjIzLTEuOTg0Yy0uNjQyLTEuMTk2LTEuNDMzLTIuMzA2LTIuMzUzLTMuMzA0LS41NC0uNjUtMS4wMjctMS4zNC0xLjQ2Mi0yLjA2MmE0LjI1IDQuMjUgMCAwIDAtLjMyMS0uNTE3LjY5LjY5IDAgMCAwLTEuMjE0LjIzIDIuNDQgMi40NCAwIDAgMC0uMTI3LjgwM2wtLjEgNC42N2EyLjI4IDIuMjggMCAwIDEtLjE3NS43ODcgMi4xNiAyLjE2IDAgMCAwLS4wNDcgMS45NDcuNzguNzggMCAwIDEtLjU2MiAxLjEyNCA0LjY0IDQuNjQgMCAwIDEtMy41NjQtLjFjLS42MTQtLjI1LTEuMDEtLjg1LTEtMS41MTNsLS4xMi0zLjM1NGMtLjA3My0uNjk2LjE5Mi0xLjM4Ni43MTMtMS44NTQuMjI0LS4yMDcuNDE1LS40NDcuNTY3LS43MTIuMzQ1LS41LjMyMy0xLjE1LS4wNTMtMS42MTZBNi4zNSA2LjM1IDAgMCAxIC45NjggNi4wMTRsLjA3NS0zLjM0Ni4wMDgtLjgxM0ExLjAxIDEuMDEgMCAwIDEgMi4zNDYuNzE1YTcuMDEgNy4wMSAwIDAgMCAyLjQ4LS40NjMgMS41IDEuNSAwIDAgMSAyLjA1OS45MTZjLjEyOC4yNzYuMjI2LjU2NS4zNC44NDhhMS43IDEuNyAwIDAgMCAxLjAyNiAxLjA2MkEyLjQzIDIuNDMgMCAwIDEgOS40NiA0LjExOWwzLjE4OCA0LjU5NGE3Ljk3IDcuOTcgMCAwIDAgMS4xMjQgMS4zMDljLjQ1NS40MTMuODMyLjI4NC45MDYtLjM0MmExNC44MyAxNC44MyAwIDAgMCAuMTM1LTIuOTMzIDMyLjgzIDMyLjgzIDAgMCAxIC4wNTEtNC41NjJjLS4wOTgtLjUyLjA4LTEuMDUyLjQ3LTEuNDA4YTEuNTIgMS41MiAwIDAgMSAxLjQ0NS0uMzM4bDEuMTI0LjA2NGEyLjE3IDIuMTcgMCAwIDEgMi4yNjIgMS44MDEgNS44OSA1Ljg5IDAgMCAxIC4yMDIgMS4zMDFsLjAxIDIuNTQzenoiIGZpbGw9IiNmZmZmZmYiLz48L3N2Zz4K&label=Nagios%20Plugins)](https://github.com/nagios-plugins/nagios-plugins) |    2.4.12 |
|                                     [![NCPA](https://img.shields.io/github/v/release/NagiosEnterprises/ncpa?logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEiIHdpZHRoPSIyNiIgaGVpZ2h0PSIyNiI+PHBhdGggZD0iTS4wMDEgMjQuMTcxYTIuODkgMi44OSAwIDAgMSAzLjAyOS0xLjM2N2MyLjc2LjMgNS41NDcuMjg0IDguMzA0LS4wNS45MDYtLjEyIDEuODIzLS4xMjYgMi43My0uMDJsNC4yNDQuMzVhOS4zMyA5LjMzIDAgMCAxIDEuMy4xODMuOTIuOTIgMCAwIDEgLjc2OS43MjEuOS45IDAgMCAxLS41MTIgMS4wMTQgMi42NyAyLjY3IDAgMCAxLTEuMjMuMzUzbC00LjU2LS4yMTZhMzMuOTUgMzMuOTUgMCAwIDAtMy45NDUuMTEyYy0xLjgxNS4xOC0zLjY0NC4xOTItNS40Ni4wMzQtMS4wMDctLjA4OC0yLjAyNy0uMDMyLTMuMDQtLjA1YTEuNzcgMS43NyAwIDAgMS0xLjYzLS42NnpNMjAuMzM3IDYuMTU3bC4xNSAzLjQ1MmExNy4yMyAxNy4yMyAwIDAgMS0uMDcgMi4yMyAxNi41MiAxNi41MiAwIDAgMCAwIDQuNjU4Yy4wOTUuNjcuMDc0IDEuMzUtLjA2IDIuMDEzYTEuNzMgMS43MyAwIDAgMS0xLjkwOCAxLjYwNmMtMS4xMTQtLjA2LTIuMjItLjIyMi0zLjMwNC0uNDgyYTMuMzkgMy4zOSAwIDAgMS0xLjg5NC0xLjQ3MyAyMS4xMSAyMS4xMSAwIDAgMS0xLjIzLTEuOTg0Yy0uNjQyLTEuMTk2LTEuNDMzLTIuMzA2LTIuMzUzLTMuMzA0LS41NC0uNjUtMS4wMjctMS4zNC0xLjQ2Mi0yLjA2MmE0LjI1IDQuMjUgMCAwIDAtLjMyMS0uNTE3LjY5LjY5IDAgMCAwLTEuMjE0LjIzIDIuNDQgMi40NCAwIDAgMC0uMTI3LjgwM2wtLjEgNC42N2EyLjI4IDIuMjggMCAwIDEtLjE3NS43ODcgMi4xNiAyLjE2IDAgMCAwLS4wNDcgMS45NDcuNzguNzggMCAwIDEtLjU2MiAxLjEyNCA0LjY0IDQuNjQgMCAwIDEtMy41NjQtLjFjLS42MTQtLjI1LTEuMDEtLjg1LTEtMS41MTNsLS4xMi0zLjM1NGMtLjA3My0uNjk2LjE5Mi0xLjM4Ni43MTMtMS44NTQuMjI0LS4yMDcuNDE1LS40NDcuNTY3LS43MTIuMzQ1LS41LjMyMy0xLjE1LS4wNTMtMS42MTZBNi4zNSA2LjM1IDAgMCAxIC45NjggNi4wMTRsLjA3NS0zLjM0Ni4wMDgtLjgxM0ExLjAxIDEuMDEgMCAwIDEgMi4zNDYuNzE1YTcuMDEgNy4wMSAwIDAgMCAyLjQ4LS40NjMgMS41IDEuNSAwIDAgMSAyLjA1OS45MTZjLjEyOC4yNzYuMjI2LjU2NS4zNC44NDhhMS43IDEuNyAwIDAgMCAxLjAyNiAxLjA2MkEyLjQzIDIuNDMgMCAwIDEgOS40NiA0LjExOWwzLjE4OCA0LjU5NGE3Ljk3IDcuOTcgMCAwIDAgMS4xMjQgMS4zMDljLjQ1NS40MTMuODMyLjI4NC45MDYtLjM0MmExNC44MyAxNC44MyAwIDAgMCAuMTM1LTIuOTMzIDMyLjgzIDMyLjgzIDAgMCAxIC4wNTEtNC41NjJjLS4wOTgtLjUyLjA4LTEuMDUyLjQ3LTEuNDA4YTEuNTIgMS41MiAwIDAgMSAxLjQ0NS0uMzM4bDEuMTI0LjA2NGEyLjE3IDIuMTcgMCAwIDEgMi4yNjIgMS44MDEgNS44OSA1Ljg5IDAgMCAxIC4yMDIgMS4zMDFsLjAxIDIuNTQzenoiIGZpbGw9IiNmZmZmZmYiLz48L3N2Zz4K&label=NCPA)](https://github.com/NagiosEnterprises/ncpa) |     3.2.0 |
|                                     [![NRPE](https://img.shields.io/github/v/release/NagiosEnterprises/nrpe?logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEiIHdpZHRoPSIyNiIgaGVpZ2h0PSIyNiI+PHBhdGggZD0iTS4wMDEgMjQuMTcxYTIuODkgMi44OSAwIDAgMSAzLjAyOS0xLjM2N2MyLjc2LjMgNS41NDcuMjg0IDguMzA0LS4wNS45MDYtLjEyIDEuODIzLS4xMjYgMi43My0uMDJsNC4yNDQuMzVhOS4zMyA5LjMzIDAgMCAxIDEuMy4xODMuOTIuOTIgMCAwIDEgLjc2OS43MjEuOS45IDAgMCAxLS41MTIgMS4wMTQgMi42NyAyLjY3IDAgMCAxLTEuMjMuMzUzbC00LjU2LS4yMTZhMzMuOTUgMzMuOTUgMCAwIDAtMy45NDUuMTEyYy0xLjgxNS4xOC0zLjY0NC4xOTItNS40Ni4wMzQtMS4wMDctLjA4OC0yLjAyNy0uMDMyLTMuMDQtLjA1YTEuNzcgMS43NyAwIDAgMS0xLjYzLS42NnpNMjAuMzM3IDYuMTU3bC4xNSAzLjQ1MmExNy4yMyAxNy4yMyAwIDAgMS0uMDcgMi4yMyAxNi41MiAxNi41MiAwIDAgMCAwIDQuNjU4Yy4wOTUuNjcuMDc0IDEuMzUtLjA2IDIuMDEzYTEuNzMgMS43MyAwIDAgMS0xLjkwOCAxLjYwNmMtMS4xMTQtLjA2LTIuMjItLjIyMi0zLjMwNC0uNDgyYTMuMzkgMy4zOSAwIDAgMS0xLjg5NC0xLjQ3MyAyMS4xMSAyMS4xMSAwIDAgMS0xLjIzLTEuOTg0Yy0uNjQyLTEuMTk2LTEuNDMzLTIuMzA2LTIuMzUzLTMuMzA0LS41NC0uNjUtMS4wMjctMS4zNC0xLjQ2Mi0yLjA2MmE0LjI1IDQuMjUgMCAwIDAtLjMyMS0uNTE3LjY5LjY5IDAgMCAwLTEuMjE0LjIzIDIuNDQgMi40NCAwIDAgMC0uMTI3LjgwM2wtLjEgNC42N2EyLjI4IDIuMjggMCAwIDEtLjE3NS43ODcgMi4xNiAyLjE2IDAgMCAwLS4wNDcgMS45NDcuNzguNzggMCAwIDEtLjU2MiAxLjEyNCA0LjY0IDQuNjQgMCAwIDEtMy41NjQtLjFjLS42MTQtLjI1LTEuMDEtLjg1LTEtMS41MTNsLS4xMi0zLjM1NGMtLjA3My0uNjk2LjE5Mi0xLjM4Ni43MTMtMS44NTQuMjI0LS4yMDcuNDE1LS40NDcuNTY3LS43MTIuMzQ1LS41LjMyMy0xLjE1LS4wNTMtMS42MTZBNi4zNSA2LjM1IDAgMCAxIC45NjggNi4wMTRsLjA3NS0zLjM0Ni4wMDgtLjgxM0ExLjAxIDEuMDEgMCAwIDEgMi4zNDYuNzE1YTcuMDEgNy4wMSAwIDAgMCAyLjQ4LS40NjMgMS41IDEuNSAwIDAgMSAyLjA1OS45MTZjLjEyOC4yNzYuMjI2LjU2NS4zNC44NDhhMS43IDEuNyAwIDAgMCAxLjAyNiAxLjA2MkEyLjQzIDIuNDMgMCAwIDEgOS40NiA0LjExOWwzLjE4OCA0LjU5NGE3Ljk3IDcuOTcgMCAwIDAgMS4xMjQgMS4zMDljLjQ1NS40MTMuODMyLjI4NC45MDYtLjM0MmExNC44MyAxNC44MyAwIDAgMCAuMTM1LTIuOTMzIDMyLjgzIDMyLjgzIDAgMCAxIC4wNTEtNC41NjJjLS4wOTgtLjUyLjA4LTEuMDUyLjQ3LTEuNDA4YTEuNTIgMS41MiAwIDAgMSAxLjQ0NS0uMzM4bDEuMTI0LjA2NGEyLjE3IDIuMTcgMCAwIDEgMi4yNjIgMS44MDEgNS44OSA1Ljg5IDAgMCAxIC4yMDIgMS4zMDFsLjAxIDIuNTQzenoiIGZpbGw9IiNmZmZmZmYiLz48L3N2Zz4K&label=NRPE)](https://github.com/NagiosEnterprises/nrpe) |     4.1.3 |
|                                     [![NSCA](https://img.shields.io/github/v/release/NagiosEnterprises/nsca?logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEiIHdpZHRoPSIyNiIgaGVpZ2h0PSIyNiI+PHBhdGggZD0iTS4wMDEgMjQuMTcxYTIuODkgMi44OSAwIDAgMSAzLjAyOS0xLjM2N2MyLjc2LjMgNS41NDcuMjg0IDguMzA0LS4wNS45MDYtLjEyIDEuODIzLS4xMjYgMi43My0uMDJsNC4yNDQuMzVhOS4zMyA5LjMzIDAgMCAxIDEuMy4xODMuOTIuOTIgMCAwIDEgLjc2OS43MjEuOS45IDAgMCAxLS41MTIgMS4wMTQgMi42NyAyLjY3IDAgMCAxLTEuMjMuMzUzbC00LjU2LS4yMTZhMzMuOTUgMzMuOTUgMCAwIDAtMy45NDUuMTEyYy0xLjgxNS4xOC0zLjY0NC4xOTItNS40Ni4wMzQtMS4wMDctLjA4OC0yLjAyNy0uMDMyLTMuMDQtLjA1YTEuNzcgMS43NyAwIDAgMS0xLjYzLS42NnpNMjAuMzM3IDYuMTU3bC4xNSAzLjQ1MmExNy4yMyAxNy4yMyAwIDAgMS0uMDcgMi4yMyAxNi41MiAxNi41MiAwIDAgMCAwIDQuNjU4Yy4wOTUuNjcuMDc0IDEuMzUtLjA2IDIuMDEzYTEuNzMgMS43MyAwIDAgMS0xLjkwOCAxLjYwNmMtMS4xMTQtLjA2LTIuMjItLjIyMi0zLjMwNC0uNDgyYTMuMzkgMy4zOSAwIDAgMS0xLjg5NC0xLjQ3MyAyMS4xMSAyMS4xMSAwIDAgMS0xLjIzLTEuOTg0Yy0uNjQyLTEuMTk2LTEuNDMzLTIuMzA2LTIuMzUzLTMuMzA0LS41NC0uNjUtMS4wMjctMS4zNC0xLjQ2Mi0yLjA2MmE0LjI1IDQuMjUgMCAwIDAtLjMyMS0uNTE3LjY5LjY5IDAgMCAwLTEuMjE0LjIzIDIuNDQgMi40NCAwIDAgMC0uMTI3LjgwM2wtLjEgNC42N2EyLjI4IDIuMjggMCAwIDEtLjE3NS43ODcgMi4xNiAyLjE2IDAgMCAwLS4wNDcgMS45NDcuNzguNzggMCAwIDEtLjU2MiAxLjEyNCA0LjY0IDQuNjQgMCAwIDEtMy41NjQtLjFjLS42MTQtLjI1LTEuMDEtLjg1LTEtMS41MTNsLS4xMi0zLjM1NGMtLjA3My0uNjk2LjE5Mi0xLjM4Ni43MTMtMS44NTQuMjI0LS4yMDcuNDE1LS40NDcuNTY3LS43MTIuMzQ1LS41LjMyMy0xLjE1LS4wNTMtMS42MTZBNi4zNSA2LjM1IDAgMCAxIC45NjggNi4wMTRsLjA3NS0zLjM0Ni4wMDgtLjgxM0ExLjAxIDEuMDEgMCAwIDEgMi4zNDYuNzE1YTcuMDEgNy4wMSAwIDAgMCAyLjQ4LS40NjMgMS41IDEuNSAwIDAgMSAyLjA1OS45MTZjLjEyOC4yNzYuMjI2LjU2NS4zNC44NDhhMS43IDEuNyAwIDAgMCAxLjAyNiAxLjA2MkEyLjQzIDIuNDMgMCAwIDEgOS40NiA0LjExOWwzLjE4OCA0LjU5NGE3Ljk3IDcuOTcgMCAwIDAgMS4xMjQgMS4zMDljLjQ1NS40MTMuODMyLjI4NC45MDYtLjM0MmExNC44MyAxNC44MyAwIDAgMCAuMTM1LTIuOTMzIDMyLjgzIDMyLjgzIDAgMCAxIC4wNTEtNC41NjJjLS4wOTgtLjUyLjA4LTEuMDUyLjQ3LTEuNDA4YTEuNTIgMS41MiAwIDAgMSAxLjQ0NS0uMzM4bDEuMTI0LjA2NGEyLjE3IDIuMTcgMCAwIDEgMi4yNjIgMS44MDEgNS44OSA1Ljg5IDAgMCAxIC4yMDIgMS4zMDFsLjAxIDIuNTQzenoiIGZpbGw9IiNmZmZmZmYiLz48L3N2Zz4K&label=NSCA)](https://github.com/NagiosEnterprises/nsca) |    2.10.3 |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            [![MongoSH](https://img.shields.io/github/v/release/mongodb-js/mongosh?logo=mongodb&label=MongoSH)](https://github.com/mongodb-js/mongosh) |     2.5.8 |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    [![Check-MongoDB Plugins](https://img.shields.io/github/v/release/m-erhardt/check-mongodb-plugins?logo=mongodb&label=Check-MongoDB%20Plugins)](https://github.com/m-erhardt/check-mongodb-plugins) |     1.0.0 |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      [![NagiosTV](https://img.shields.io/github/v/release/chriscareycode/nagiostv-react?logo=react&label=NagiosTV)](https://github.com/chriscareycode/nagiostv-react) |     0.9.5 |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       [![s6-overlay](https://img.shields.io/github/v/release/just-containers/s6-overlay?logo=github&label=s6-overlay)](https://github.com/just-containers/s6-overlay) |   3.2.1.0 |

## Application Setup

- Access the webui at `http://<your-ip>:8080`, for more information check out [Nagios Core](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/toc.html).
- Access [NagiosTV](https://nagiostv.com/) webui at `http://<your-ip>:8080/nagiostv`.

[<img src="https://www.nagios.org/wp-content/uploads/2023/01/Nagios-Blue-N.svg" alt="Nagios" width="250" />](https://www.nagios.org/)

### Download image

```shell
docker pull ghcr.io/arajczy/nagios:latest
```

## Usage

### docker cli

```shell
docker run \
    -d \
    --name=nagios \
    --hostname= `#optional` \
    --cap-add=NET_RAW \
    --env MAIL_ADDRESS= `#optional` \
    --env MAIL_PASS= `#optional` \
    --env MAIL_RELAY_HOST= `#optional` \
    --env NAGIOS_FQDN= `#optional` \
    --env NAGIOSADMIN_USER= `#optional` \
    --env NAGIOSADMIN_PASS= `#optional` \
    --env NAGIOS_THEME= `#optional` \
    --env NAGIOS_STARTPAGE= `#optional` \
    --env TZ=Etc/UTC \
    --publish=8080:80 \
    --volume /path/to/config:/usr/local/nagios/etc \
    --volume /path/to/log:/usr/local/nagios/var \
    --volume /path/to/themes:/usr/local/nagios/themes \
    ghcr.io/arajczy/nagios:latest
```

### podman cli

```shell
podman run \
    -d \
    --replace \
    --name=nagios \
    --hostname= `#optional` \
    --cap-add=NET_RAW \
    --env MAIL_ADDRESS= `#optional` \
    --env MAIL_RELAY_HOST= `#optional` \
    --env NAGIOS_FQDN= `#optional` \
    --env NAGIOSADMIN_USER= `#optional` \
    --env NAGIOS_THEME= `#optional` \
    --env NAGIOS_STARTPAGE= `#optional` \
    --tz=Etc/UTC \
    --publish=8080:80 \
    --secret mail-pass,type=env,target=MAIL_PASS \
    --secret nagiosadmin-pass,type=env,target=NAGIOSADMIN_PASS \
    --volume /path/to/config:/usr/local/nagios/etc \
    --volume /path/to/log:/usr/local/nagios/var \
    --volume /path/to/themes:/usr/local/nagios/themes \
    ghcr.io/arajczy/nagios:latest
```

### docker-compose

```yaml
    ---
    version: '3'
    services:
      nagios:
        image: arajczy/nagios:latest
        hostname: nagios.example.com
        cap_add:
          - NET_RAW
        environment:
          MAIL_ADDRESS: #optional
          MAIL_PASS: #optional
          MAIL_RELAY_HOST: #optional
          NAGIOS_FQDN: #optional
          NAGIOSADMIN_USER: #optional
          NAGIOSADMIN_PASS: #optional
          NAGIOS_THEME: #optional
          NAGIOS_STARTPAGE: #optional
          TZ: Etc/UTC
        ports: 8080:80/tcp
        volumes:
        - nagios-etc:/opt/nagios/etc
        - nagios-themes:/opt/nagios/themes
        - nagios-var:/opt/nagios/var

    volumes:
        nagios-etc:
        nagios:themes:
        nagios-var:
```

### systemd container service

On Linux hosts with podman installed you can run this container as a systemd service, too.

#### steps to enable nagios container as a systemd service

1.  Copy below content and paste it to:

    ```shell
    $HOME/.config/containers/systemd/nagios.container
    ```

2.  Perform a systemd reload:

    ```shell
    systemctl --user daemon-reload
    ```

3.  Start service:

    ```shell
    systemctl --user start nagios.service
    ```

#### steps to disable nagios container service

1.  Enter commands:

    ```shell
    systemctl --user stop nagios.service
    ```

2.  Remove container file:

    ```shell
    $HOME/.config/containers/systemd/nagios.container
    ```

3.  Perform a systemd reload:

    ```shell
    systemctl --user daemon-reload
    ```

```ini
[Unit]
Description=Nagios Core monitoring container
Wants=network-online.target
After=network-online.target

[Container]
AddCapability=NET_RAW
ContainerName=nagios
Environment=MAIL_ADDRESS= #optional
Environment=MAIL_RELAY_HOST= #optional
Environment=NAGIOS_FQDN= #optional
Environment=NAGIOSADMIN_USER= #optional
Environment=NAGIOS_THEME= #optional
Environment=NAGIOS_STARTPAGE= #optional
HostName= #optional
Image=ghcr.io/arajczy/nagios:latest
Notify=common
PublishPort=8080:80/tcp
Secret=mail-pass,type=env,target=MAIL_PASS
Secret=nagiosadmin-pass,type=env,target=NAGIOSADMIN_PASS
Timezone=local
Volume=nagios-etc:/usr/local/nagios/etc
Volume=nagios-themes:/usr/local/nagios/themes
Volume=nagios-var:/usr/local/nagios/var

[Service]
Restart=on-failure
TimeoutStopSec=70

[Install]
WantedBy=default.target
```

## Parameters

|                                  Parameter | Function                                                      |
| -----------------------------------------: | ------------------------------------------------------------- |
|                           `-p 8080:80/tcp` | WebUI                                                         |
|                         `-e MAIL_ADDRESS=` | Specify your email address                                    |
|                            `-e MAIL_PASS=` | Specify your email application password                       |
|                      `-e MAIL_RELAY_HOST=` | default: "[smtp.gmail.com]:587"                               |
|                          `-e NAGIOS_FQDN=` | Specify your server FQDN                                      |
|                     `-e NAGIOSADMIN_USER=` | default: nagiosadmin                                          |
|                     `-e NAGIOSADMIN_PASS=` | default: nagios                                               |
|                         `-e NAGIOS_THEME=` | "default", "dark"                                             |
|                     `-e NAGIOS_STARTPAGE=` | "default", "services", "hosts", "overview", "summary", "grid" |
| `-v /path/to/config:/usr/local/nagios/etc` | Persistent volume for nagios config                           |
|          `-v /path/to/log:/opt/nagios/var` | Persistent volume for nagios logs                             |
|    `-v /path/to/themes:/opt/nagios/themes` | Persistent volume for themes                                  |

## Support Info

- Shell access inside running container:

  ```sh
  docker exec -it nagios bash
  ```

- monitor the logs of running container:

  ```sh
  docker logs -f nagios
  ```
