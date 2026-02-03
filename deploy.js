const hre = require("hardhat");

async function main() {
  const Collection = await hre.ethers.getContractFactory("RoyaltyNFT");
  const nft = await Collection.deploy(
    "Cyber Explorers", 
    "CYBER", 
    "ipfs://QmExampleHash/"
  );

  await nft.waitForDeployment();
  console.log("NFT Contract deployed to:", await nft.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
