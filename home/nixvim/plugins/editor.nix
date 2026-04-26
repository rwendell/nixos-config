{ lib, ... }:
{
  plugins.which-key = {
    enable = true;
  };

  plugins.blink-cmp = {
    enable = true;
    fuzzy = { implementation = "prefer_rust_with_warning"; };
    completion = {
      documentation = { autoShow = false; };
    };
    sources = {
      default = [ "lsp" "path" "snippets" "buffer" ];
    };
    snippets = { preset = "luasnip"; };
    appearance = {
      nerdFontVariant = "mono";
    };
  };

  plugins.oil = {
    enable = true;
  };
}