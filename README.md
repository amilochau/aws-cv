<p align="center">
  <a href="https://cv.milochau.com" target="_blank">
    <img alt="aws-cv logo" width="100" src="./src/cv-client/src/assets/logo.png">
  </a>
</p>
<p align="center">
  <a href="https://github.com/milochaucom/cv/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/milochaucom/cv" alt="License">
  </a>
</p>
<h1 align="center">
  aws-cv
</h1>

`aws-cv` is an online Curriculum Vitae, used to present personal projects and experiences.

## Main features

- Personal information display
- UI optimized for print
- API to let users update their CV

## Usage

To use `aws-cv` in your own organization, you have to adapt it.

1. Fork the current repository
2. Adapt the organization-specific settings to your own organization
3. Deploy it

The following files have to be adapted.

| File | Adaptations needed | Comment |
| ---- | ------------------ | ------- |
| [CD - deploy settings](./.github/workflows/deploy.yml) | Change the `INFRA_AWS_ROLE`, `INFRA_AWS_REGION` settings |
| [IaC - dev settings](./infra/hosts/dev.tfvars) | Change the `conventions` and `domains` |
| [IaC - prd settings](./infra/hosts/prd.tfvars) | Change the `conventions` and `domains` |
| [API settings](./src/contacts-client/src/data/config.ts) | Change the environment-specific API settings |
| [Resume content - en](./src/cv-client/src/data/resume/en.json) | Change the English-specific resume content |
| [Resume content - fr](./src/cv-client/src/data/resume/fr.json) | Change the French-specific resume content |

## Underlying technologies

`aws-cv` uses the following technologies to work:

- Front-End (UI client): `vue.js v3`, `vuetify`
- Back-End (Functions): `.NET 8.0 native AOT`
- Infrastructure: `AWS CloudFront`, `AWS Lambda`, `AWS S3`, `AWS DynamoDB`, `AWS Cognito`
- DevOps: `GitHub Actions`, `Terraform`

The following `amilochau` packages are used:

- [amilochau/core-aws](https://github.com/amilochau/core-aws): AWS Lambda, AWS DynamoDB helpers
- [amilochau/core-vue3](https://github.com/amilochau/core-vue3): vue.js v3 layout
- [amilochau/github-actions](https://github.com/amilochau/github-actions): GitHub Actions
- [amilochau/tf-modules](https://github.com/amilochau/tf-modules): Terraform modules

--- 

## Contribute

Feel free to push your code if you agree with publishing under the [MIT license](./LICENSE).
