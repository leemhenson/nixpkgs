{ stdenv, fetchFromGitHub, meson, ninja, pkg-config
, libdrm, libva, libX11, libXext, libXfixes, wayland
}:

stdenv.mkDerivation rec {
  pname = "libva-utils";
  inherit (libva) version;

  src = fetchFromGitHub {
    owner  = "intel";
    repo   = "libva-utils";
    rev    = version;
    sha256 = "1xylc940ffhqay9lyy48872cfw61ziky8dw21vm69psngfz3zs9n";
  };

  nativeBuildInputs = [ meson ninja pkg-config ];

  buildInputs = [ libdrm libva libX11 libXext libXfixes wayland ];

  meta = with stdenv.lib; {
    description = "A collection of utilities and examples for VA-API";
    longDescription = ''
      libva-utils is a collection of utilities and examples to exercise VA-API
      in accordance with the libva project.
    '';
    homepage = "https://github.com/intel/libva-utils";
    changelog = "https://raw.githubusercontent.com/intel/libva-utils/${version}/NEWS";
    license = licenses.mit;
    maintainers = with maintainers; [ primeos ];
    platforms = platforms.unix;
  };
}
