import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.18",
};

module.exports = {
  solidity: "0.8.18",

  networks: {
    development: {
      url: "http://127.0.0.1:8545",
      chainId: 31337
    },

    goerli: {
      url: "https://goerli.infura.io/v3/37a3e8867e8c41709b94632d4af310ac",
      chainId: 5,
      accounts: [
        ""
      ]
    },

    etherscan: {
      apiKey:{
        goerli: "",
      }
    }
  }
};

export default config;
