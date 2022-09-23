const main = async () => {
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal"); // Hardhat Runtime Environment
    const waveContract = await waveContractFactory.deploy();
    await waveContract.deployed();
    console.log("Contract addy:", waveContract.address);

    let wavesCount;
    wavesCount = await waveContract.getTotalWaves();
    console.log(wavesCount.toNumber());


    let wave = await waveContract.wave("A message!");
    await wave.wait();

    const [_randomPerson] = await hre.ethers.getSigners();
    wave = await waveContract.connect(_randomPerson).wave("Another message")
    await wave.wait();

    let allWaves = await waveContract.getAllWaves();
    console.log(allWaves);
  };


  const runMain = async () => {
    try {
      await main();
      process.exit(0); // exit Node process without error
    } catch (error) {
      console.log(error);
      process.exit(1); // exit Node process while indicating 'Uncaught Fatal Exception' error
    }
  };

  runMain();