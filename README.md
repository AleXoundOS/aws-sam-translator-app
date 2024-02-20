# Nix flake for aws-sam-translate application

### just build

```console
$ nix build github:alexoundos/aws-sam-translator-app
```

### just run

```console
$ nix run github:alexoundos/aws-sam-translator-app -- --help
```

### build after manual git clone

```console
$ nix build
```

### run after manual git clone

```console
$ nix run . -- --help
```

### run after nix build

```console
$ result/bin/sam-translate.py --help
```

### install to a nix profile

```console
$ nix profile install github:alexoundos/aws-sam-translator-app
```

### run after nix profile install

```console
$ sam-translate.py --help
```
