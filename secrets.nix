let
  keys = [
    "age1tag1qvqv67kc6xn3hgvjx4cx623sqn7jwprnryw2ehl3qzftvwd2a9hdvzl0zxz" # dele
    "age1tag1qgq5lsv9q5xcesvjsyzrdc3ghjhtpam8h7jfd0vtkdyg66lwgfhecmdztvq" # nemo
  ];

  secrets = {
    "kagi_api_key" = keys;
  };
in

builtins.listToAttrs (
  map (secretName: {
    name = "secrets/${secretName}.age";
    value.publicKeys = secrets."${secretName}";
  }) (builtins.attrNames secrets)
)
