# faketpm

This project provides a fake [Trusted Platform Module](https://en.wikipedia.org/wiki/Trusted_Platform_Module) (TPM) for systems that lack a real one. To do so it leverages [SWTPM](https://github.com/stefanberger/swtpm), a software TPM emulator.

## Usage

faketpm is packaged in Fedora as of Fedora Linux 39. It can be installed with:

```
$ sudo dnf install faketpm
```

To start the TPM and enable it on boot then run:

```
$ sudo systemctl enable --now faketpm
```

faketpm will initialize the TPM on the first run and store its state under `/var/lib/faketpm` by default. The location can be customized by setting `TPMSTATE` in `/etc/sysconfig/faketpm`.

If you plan to interact from the TPM as a non-root user, you also probably want to join the `tss` group:

```
$ sudo usermod -aG tss $USER
```

## License

This project is [BSD 3-Clause](https://spdx.org/licenses/BSD-3-Clause.html) licensed. See the [LICENSE](LICENSE) file for the full text of the license.
