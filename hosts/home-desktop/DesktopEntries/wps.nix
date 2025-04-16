{ pkgs, lib, ... }:

let
  firejailWrapper = {
    pkg,
    oldBin,
    newBin,
    extraArgs ? [],
    desktopName,
    desktopIcon ? null,
    desktopCategories ? [ "Office" ],
  }:
    let
      originalExePath = "${pkg}/bin/${oldBin}";

      wrapperScript = pkgs.writeShellScriptBin newBin ''
        #!${pkgs.stdenv.shell}
        if [ ! -x "${originalExePath}" ]; then
          echo "Error: Could not find executable ${originalExePath}" >&2
          exit 1
        fi
        exec ${pkgs.firejail}/bin/firejail \
          --net=none \
          ${lib.escapeShellArgs extraArgs} \
          "${originalExePath}" \
          "$@"
      '';
    in
    {
      package = wrapperScript;

      desktopEntry = {
        name = desktopName;
        exec = "${wrapperScript}/bin/${newBin} %U";
        icon = desktopIcon;
        terminal = false;
        type = "Application";
        categories = desktopCategories;
      };
    };

  Excel = firejailWrapper {
    pkg = pkgs.wpsoffice;
    oldBin = "et";
    newBin = "excel";
    desktopName = "Excel";
    desktopIcon = "wps-office-et";
    desktopCategories = [ "Office" "Spreadsheet" ];
  };

  Word = firejailWrapper {
    pkg = pkgs.wpsoffice;
    oldBin = "wps";
    newBin = "word";
    desktopName = "Word";
    desktopIcon = "wps-office-wps";
    desktopCategories = [ "Office" "WordProcessor" ];
  };

  PowerPoint = firejailWrapper {
    pkg = pkgs.wpsoffice;
    oldBin = "wpp";
    newBin = "powerpoint";
    desktopName = "PowerPoint";
    desktopIcon = "wps-office-wpp";
    desktopCategories = [ "Office" "Presentation" ];
  };

  Pdf = firejailWrapper {
    pkg = pkgs.wpsoffice;
    oldBin = "wpspdf";
    newBin = "pdf";
    desktopName = "Pdf Viewer";
    desktopIcon = "wps-office-pdf";
    desktopCategories = [ "Office" "Viewer" "Graphics" ];
  };

  disableList = [
    "wps-office-et"
    "wps-office-pdf"
    "wps-office-prometheus"
    "wps-office-wpp"
    "wps-office-wps"
  ];

  disableEntries = lib.listToAttrs (map (entryName:
    lib.nameValuePair entryName {
      name = entryName;
      settings.NoDisplay = "true";
    }
  ) disableList);

in
{
  home.packages = [
    pkgs.firejail
    pkgs.wpsoffice
    Excel.package
    Word.package
    PowerPoint.package
    Pdf.package
  ];

  xdg.desktopEntries =
    {
      excel = Excel.desktopEntry;
      word = Word.desktopEntry;
      powerpoint = PowerPoint.desktopEntry;
      pdf = Pdf.desktopEntry;
    } // disableEntries;

   xdg.mimeApps.defaultApplications = {
     "application/vnd.ms-excel" = [ "excel.desktop" ];
     "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [ "excel.desktop" ];
     "application/msword" = [ "word.desktop" ];
     "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [ "word.desktop" ];
     "application/vnd.ms-powerpoint" = [ "powerpoint.desktop" ];
     "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [ "powerpoint.desktop" ];
     "application/pdf" = [ "pdf.desktop" ];
   };
}
