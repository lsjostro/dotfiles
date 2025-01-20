{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kail
    kapp
    krew
    kubectl
    kubectl-cnpg
    kubectl-neat
    kubectl-view-secret
    kubectx
    kubelogin-oidc
    kubernetes-helm
    kustomize
  ];

  programs.k9s = {
    enable = true;
    settings.k9s = {
      liveViewAutoRefresh = false;
      refreshRate = 2;
      maxConnRetry = 5;
      readOnly = false;
      noExitOnCtrlC = false;
      skipLatestRevCheck = false;
      disablePodCounting = false;
      imageScans.enable = false;
      logger = {
        tail = 100;
        buffer = 5000;
        sinceSeconds = -1;
        textWrap = false;
        showTime = false;
      };
      shellPod.image = "alpine:3";
      thresholds = {
        cpu = {
          critical = 90;
          warn = 70;
        };
        memory = {
          critical = 90;
          warn = 70;
        };
      };
      ui = {
        crumbsless = true;
        defaultsToFullScreen = true;
        enableMouse = false;
        headless = true;
        logoless = true;
        noIcons = false;
        reactive = false;
        skin = "dieter";
      };
    };

    views = {
      views = {
        "v1/pods" = {
          columns = [
            "NAME"
            "PF"
            "READY"
            "STATUS"
            "NODE"
            "AGE"
            "RESTARTS"
            "IP"
            "CPU"
            "MEM"
            "CPU/R:L"
            "MEM/R:L"
            "%CPU/R"
            "%CPU/L"
            "%MEM/R"
            "%MEM/L"
          ];
        };
      };
    };

    skins.dieter.k9s = {
      body = {
        fgColor = "default";
        bgColor = "default";
        logoColor = "default";
      };
      prompt = {
        fgColor = "default";
        bgColor = "default";
        suggestColor = "default";
      };
      info = {
        fgColor = "default";
        sectionColor = "default";
      };
      dialog = {
        fgColor = "default";
        bgColor = "default";
        buttonFgColor = "default";
        buttonBgColor = "default";
        buttonFocusFgColor = "white";
        buttonFocusBgColor = "darkblue";
        labelFgColor = "default";
        fieldFgColor = "default";
      };
      frame = {
        border = {
          fgColor = "default";
          focusColor = "default";
        };
        menu = {
          fgColor = "default";
          keyColor = "default";
          numKeyColor = "default";
        };
        crumbs = {
          fgColor = "default";
          bgColor = "default";
          activeColor = "default";
        };
        status = {
          newColor = "default";
          modifyColor = "default";
          addColor = "default";
          errorColor = "red";
          highlightColor = "default";
          killColor = "default";
          completedColor = "default";
        };
        title = {
          fgColor = "default";
          bgColor = "default";
          highlightColor = "default";
          counterColor = "default";
          filterColor = "default";
        };
      };
      views = {
        table = {
          fgColor = "default";
          bgColor = "default";
          cursorFgColor = "teal";
          cursorBgColor = "darkblue";
          header = {
            fgColor = "default";
            bgColor = "default";
            sorterColor = "blue";
          };
        };
        xray = {
          fgColor = "default";
          bgColor = "default";
          cursorColor = "blue";
          graphicColor = "blue";
        };
        yaml = {
          keyColor = "default";
          colonColor = "default";
          valueColor = "default";
        };
        logs = {
          fgColor = "default";
          bgColor = "default";
          indicator = {
            fgColor = "default";
            bgColor = "default";
            toggleOnColor = "default";
            toggleOffColor = "default";
          };
        };
      };
    };
  };
}
