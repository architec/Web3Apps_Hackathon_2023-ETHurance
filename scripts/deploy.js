async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account: ", deployer.address);

    const weiAmount = (await deployer.getBalance()).toString();
    console.log("Account balance: ", (await ethers.utils.formatEther(weiAmount)), " ETH");

    const ETHurance = await ethers.getContractFactory("ETHurance");
    const ethurance = await ETHurance.deploy();

    console.log("ETHurance deployed contract address: ", ethurance.address);
}

main()
.then(() => process.exit(0))
.catch((error) => {
  console.error(error);
  process.exit(1);
});