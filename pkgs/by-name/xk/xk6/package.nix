{
  lib,
  stdenv,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "xk6";
  version = "0.14.3";

  src = fetchFromGitHub {
    owner = "grafana";
    repo = "xk6";
    tag = "v${version}";
    hash = "sha256-pxiZelbAEEtibNdpEuRplPFtJ61YicoiAnAs8oaX6IA=";
  };

  subPackages = [ "./" ];

  sourceRoot = "${src.name}/cmd/xk6";

  vendorHash = null;

  meta = {
    description = "Build k6 with extensions";
    mainProgram = "xk6";
    homepage = "https://k6.io/";
    changelog = "https://github.com/grafana/xk6/releases/tag/v${version}";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ szkiba ];
  };
}
