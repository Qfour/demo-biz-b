# demo-biz-b

Sample app for business **b**. Namespaces: `b-dev`, `b-stg`, `b-prod` (Colima).

- CI: `.github/workflows/ci.yml` builds the image and runs `sysdig-cli-scanner` (needs repo secret `SECURE_API_TOKEN`).
- Deploy: `make deploy ENV=dev|stg|prod`
- Dependencies/base image are intentionally outdated to produce findings.
