{
  flake.modules.homeManager.base = {
    programs.chromium = {
      enable = true;
      extensions = [
        { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } # ProtonPass
        { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
        { id = "mdjildafknihdffpkfmmpnpoiajfjnjd"; } # Consent-O-Matic
        { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # SponsorBlock for YouTube
        { id = "gebbhagfogifgggkldgodflihgfeippi"; } # Return YouTube Dislike
        { id = "glnpjglilkicbckjpbgcfkogebgllemb"; } # Okta
      ];
    };
  };
}
