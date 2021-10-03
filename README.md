# pr12er

[![Protoc](https://github.com/codingpot/pr12er/actions/workflows/protoc.yml/badge.svg)](https://github.com/codingpot/pr12er/actions/workflows/protoc.yml)
[![CI](https://github.com/codingpot/pr12er/actions/workflows/ci.yml/badge.svg)](https://github.com/codingpot/pr12er/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/codingpot/pr12er/branch/main/graph/badge.svg?token=Vnfds9mPla)](https://codecov.io/gh/codingpot/pr12er)

<div align="center">
<img src="./pr12er_diagram.svg" width="80%">
</div>

## Dependencies

```
libprotoc 3.17.3
protoc-gen-go v1.27.0
protoc_plugin 20.0.0
```

## Install proto toolchain

```shell
make install
```

## Generated proto files

```shell
make gen.all
```

## 구조 설명

```
.
├── buf.gen.yaml          # Buf 관련 파일
├── buf.yaml              # Buf 관련 파일
├── client                # 프론트 코드 (Flutter)
├── codecov.yml           # 코드 커버리지 CI 설정 파일
├── dbctl                 # 데이터베이스 파일을 업데이트하기 위한 CLI
├── hooks                 # GitHub Hooks 설치 파일
├── k8s                   # 쿠버네티스 yaml 파일
├── LICENSE
├── Makefile              # 메인 빌드툴
├── okteto-pipeline.yaml  # production 배포 파이프라인
├── pr12er_diagram.drawio # 이 파일의 맨 위 그림을 담당
├── pr12er_diagram.svg
├── README.md
├── server                # 실제 백엔드 서버 (Go)
├── skaffold.yaml         # 개발용 skaffold 스펙
├── thirdparty            # Protocol Buffer Timestamp proto dependency
└── tools                 # 빌드툴 관련 Dockerfile
```

## Design Docs

- [PR12er 데이터 디자인](https://docs.google.com/document/d/1UE-v0mYirRdBI1kaK00mG2SPqAuYv9b2WLjEXWGDwnU/edit?usp=sharing)
