{
    "parser": "@typescript-eslint/parser",
    "extends": [
      "airbnb/base",
      "plugin:@typescript-eslint/recommended",
      "plugin:import/errors",
      "plugin:import/warnings",
      "plugin:import/typescript",
      "prettier"
    ],
    "parserOptions": {
      "ecmaVersion": 2018,
      "project": "./tsconfig.json"
    },
    "ignorePatterns": ["sonar-scanner.ts"], // This line should be add in configuration
    "plugins": ["prettier"],
    "rules": {}
  }