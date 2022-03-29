-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 29 mars 2022 à 20:22
-- Version du serveur : 5.7.33
-- Version de PHP : 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `symfony_auth`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220329190312', '2022-03-29 19:03:20', 30),
('DoctrineMigrations\\Version20220329191816', '2022-03-29 19:18:21', 18);

-- --------------------------------------------------------

--
-- Structure de la table `force_attacks`
--

CREATE TABLE `force_attacks` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) NOT NULL,
  `blocked` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `force_attacks`
--

INSERT INTO `force_attacks` (`id`, `email`, `count`, `blocked`) VALUES
(1, 'test@test.fr', 2, NULL),
(2, 'test@tetdfst.fr', 3, NULL),
(3, 'truc@trc.fgr', 5, 1),
(4, 'rdtg', 1, NULL),
(6, 'contact@auth.com', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `refresh_tokens`
--

CREATE TABLE `refresh_tokens` (
  `id` int(11) NOT NULL,
  `refresh_token` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `refresh_tokens`
--

INSERT INTO `refresh_tokens` (`id`, `refresh_token`, `username`, `valid`) VALUES
(1, '418c78afd8922a6333895dcee7e05e26911fd7ac00a5409026a626061e4154ea7f12684dd56f0ea5542960c9e374bc2cb9ae8dfd1f1ca3032abe7a3edc95da35', 'john@doe.fr', '2022-03-26 01:14:08'),
(2, 'a51aa6324d3ab1cdc592b4e4ce566c52cfad667f9841dd3f9419ebfebe386ccb17ad447c2125538263e7ca88f4f962e28818bb3235cfabed2a83f66f24fe761d', 'john@doe.fr', '2022-03-26 16:05:54'),
(3, 'c507d098f27bc704f0c261924e41fac32d72adeb3f361a2d03af49c05e64e75aa456d2cba95c0029b0c3c3bad4f5e5fe19fc232569ab66e2b55deb2465a9655f', 'john@doe.fr', '2022-03-26 16:06:39'),
(4, '34afbf392fc3c3890592542143077d21b3596a724c1ea34853856def34cd3e1267da3feb6f826f0f3972e09ba95f2726bd2434c58c7ce57f0301ad3b99933ebb', 'john@doe.fr', '2022-03-26 16:10:00'),
(5, '9ec1152a1aa6f0dfce9123dd439138a2ab15e8bae82f12ee7c17c5504cbe7fb5e441d77e50138770aff55ad8879b23257315f62878e9165a4da2b87f0668220e', 'john@doe.fr', '2022-03-26 16:11:48'),
(6, 'dd6dcdbbef635461a86a5dae2065e6f3716e0314071c828f5fe781ec8fcebc9383526e1b8553d447da68544f3977bbc2e8bb681e3b46fd9624e2c31d6e0355b3', 'john@doe.fr', '2022-03-26 16:35:02'),
(7, '74ad6b1523e0e72a58965e09a79cb9f43dae26eec52bd6cecd52b318c88b390f25c19b3313bb5cedfb9f91103c5581fb2c960247f5d6e369c932c05dbbd1e935', 'john@doe.fr', '2022-03-26 16:42:30'),
(8, 'acffe5c523cba75e5802ce9b469a23a410a4f63d846ecab67d58078ee597b5deddd82f5fdcbbcadb09f9e249d0e937650ba5553c10d2f766c294222c71f4366b', 'john@doe.fr', '2022-03-26 16:42:54'),
(9, 'a15b75b1b4a9b07c2947d9cfb2ceebc79cb4c2fb2068718f4253103dc538f8d224e8126579ab9b30192f24ecf3ef00f90867821ea4daf7d5f21c5726a430066d', 'john@doe.fr', '2022-03-26 16:44:05'),
(10, '7bba521603cfe82082599c6aaea42ce14bfd0590ab7dd7c13877ec4c833c2f8a630367d209609f73f2f5208e18441d977d2cf6d00c2bb1faf8a1b8b28c6630c3', 'john@doe.fr', '2022-03-26 16:45:42'),
(11, '1a7240eeb68b25f78b6d578328f53c985420411e3eefa1de8f6e44f713310b16e6befa0a4a8a79abc9957036fa2e6e6e64a6e745a1bb926d957075fccc54299b', 'john@doe.fr', '2022-03-26 16:46:03'),
(12, '97e036a1b1ede264f22bdcd2f3647bd4444fcd4c423c87918f55ce3f4773385c4915d85b7e0e377897a223e2a6906cdfe090572e82f904cf5972080db4e8c1f9', 'john@doe.fr', '2022-03-26 17:28:36'),
(13, '4fd4464c97c8c976d7174687dd11bfb7865d5865fb42538fbef07c74a22726a31aec5c9aff0b1ea1db620e22316da79e4bc33ac82b45d6a486d0b294efbb27be', 'john@doe.fr', '2022-03-26 17:29:13'),
(14, '9a0dfc3a4f063bfd9ebb5dd108c8a7f0dce21be793347cd94e54c4bf6deed6965c6578a3e89ff98494dfaf589e4a94a9ce31e35a7775a3c6689e78a184a66274', 'john@doe.fr', '2022-03-26 17:30:12'),
(15, '4a60e77b3858f9054d2d8746d8ef10c5af45ea5b5458b1a6a93255013cd477b003d74fedd967c9b709d4028b39764acdd2b7e36357f0e3ff694b22fe7033ff4c', 'john@doe.fr', '2022-03-26 17:32:25'),
(16, 'a1a2476400ff530fee9c7407d852389f03cfb62466a11c4fbe9ae144fb240e6494c84d7f2d57d1d7bf54a4ccc19d6f2d629c1edcbcc4850c16c5c6589b0d3719', 'john@doe.fr', '2022-03-26 17:42:46'),
(17, '3d0aff168f872fa3ce8a0046d106f579eb8902f948a15e736a780f53bfa3ee90ac07f4e205a127cf8f48e1bb1acad82a7deb88af442f789e002a230b0f5cb315', 'john@doe.fr', '2022-03-26 17:43:17'),
(18, 'f11d0d65cfe9c30eb04cfbb57e459ab3969b6bb0319b6281686899d16d9107cf62f8681f59d798660b7bb3f97652cc74e96a03468b80005a8d68dec90626559a', 'john@doe.fr', '2022-03-26 17:43:52'),
(19, '3d4ad188457d698c1d9ceacca71b5bd0769621c069f93bbc89b1efb58e8837e095e679e8ab38c776bc8f3b7b4362353861294ebd9b08ab085a442aa1bf16f600', 'john@doe.fr', '2022-03-27 22:20:43'),
(20, '6737306ae7ba2c071e007eaf4d8b438398c59b2a49ba6c39a46b88f2685756bc2f1b353ebdc9621d08e6a9a606aac018e70303bff364959a377f6288ffa0a936', 'john@doe.fr', '2022-03-27 22:25:07'),
(21, 'ac4acd09aff643127495301d2d9b5e5d8bbd618bdd430fa6ddc8db6427e128bd18c073abbf909df52cac3f050b6a1b13298a4d114df4e05d7370d659ffe8745c', 'john@doe.fr', '2022-03-27 22:26:32'),
(22, '2ec96d0f544aa28bacc4aea344677f1fcc4304f4366aed69d0746542407a910e6ecdc3edfdfba883384986fd03d706df1b1d2618b0190d837c9f75aefb3028fa', 'john@doe.fr', '2022-03-27 22:26:55'),
(23, '37c7d3a272477beccca7d0c63699680e12fa6114b56fb41291cd68fbf65f9b0d26011a92d8ea626e62501c43fa36217ee05881c3b3f10f0ef5004bbb10ba8dd3', 'john@doe.fr', '2022-03-27 22:28:38'),
(24, 'c26df1f63fd0126931e278b3630a9cc91def122faff54071713eabddb55a11720923a00a830c035671cf9c63970cfdcce6dee4ce4b56fc7763db0493bf7a687c', 'john@doe.fr', '2022-03-27 22:29:04'),
(25, 'cef8c11e6aa0f18405685f9c6c696371ff17a01fb20645d8dde8765ab807cd10ea62837e71240517ffe6172edba21cc72f78d17ea4c828857012b6130bbed2ef', 'john@doe.fr', '2022-03-27 22:29:18'),
(26, 'df9bba5dd24bdb771a064ba8f5b34342bc7218e6ea5ba6010c026e23d4f7780008ec2b0418fc247efdc41f7d3b0f9d398f2905463b466c51331d0b98a03a9b7a', 'john@doe.fr', '2022-03-27 22:31:19'),
(27, '35650922d560830bc22ac43d800478076f6aac7dbd57becd3b3f92f8002e1cf9933cb29ff321003fc3949b12274eae539abfef15f4f481ed8c87c5a305090d4d', 'john@doe.fr', '2022-03-27 22:32:10'),
(28, '58e6962db7282ac0890f98ceecf19e6b75d1fc75adb5c619981c4183860faf466442cb75c6711342a562fb5d6949ecbe318516ccd950c74a59a8017b90891a0b', 'john@doe.fr', '2022-03-27 22:41:03'),
(29, '0d291c65efe84d5c37a933ba876aa1b07b88e5f386ae0a324ab3517a50c5dd308f72ad564f1a0fa30f51f28967f56727162c411e693b8d6ada9c670464ef7124', 'john@doe.fr', '2022-03-27 23:19:48'),
(30, 'd8563f03613a38990e95259ccd06c00e4cdb50f56dbc465d36cb7f998a89ac0c9da12ce72761eece1a4f862b94de00a4da21354120887d14ed3a96e325532696', 't@test.com', '2022-03-27 23:22:15'),
(31, '8847f2a1d5423813219f3afd301189b8c6d91978e49951c12eca332389d39c44afd425bbe508f9df57b6bf3a54023b4e0cfa3b88431c2ee6f9c7ad90f6b42222', 'john@doe.fr', '2022-03-29 19:38:12'),
(32, 'ce795bd6773238af15c1137dc8eceecf22b620074ccbd01b20ff93ec6589729e77da2c9aa674149eb38a7da45c124ba86d808384f877f2625a1f184e133f1fbf', 'test@test.com', '2022-03-29 20:28:46'),
(33, '287d9f7dfac070299fab4d8c1c96baf1acf3d58b5800e92fb27fe593e17f670e5d3d5b69e2fc5752b4a587e1978068bed11882f81a619e4e1af25ba6652d436b', 'test@test.com', '2022-03-29 21:01:42'),
(34, '3107d2df060a98f580d63ae97bf44c6940a4857669c4860bc2edbfe3cde1dd45b7d5a5e15d3380995116fa1b78d6ac165f9065e4cd86062db8fb15793d5fe9ef', 'test@test.com', '2022-03-29 21:02:29'),
(35, '0b9ad2c1d2f8baa9c80ba31fb7cea211acb7518ac9e29fd67c88cfc23d6eec434a4e9c6719edbf80e1cf7cf9d5e44ae1d6162db8030e82e657fd89bebaa8b38d', 'test@test.com', '2022-03-29 21:03:44'),
(36, '70b09af478840878488366bf94cba45ea8e7afe258ce8bde997307c8de841c9f1f4d2738aacd6c0539e63fcaa0f7513d3491bd2cdbd4d50c3f5c0eeba75fce2e', 'john@doe.fr', '2022-03-29 21:08:09'),
(37, '47a242cb716f51429d08b17c342dac0dd4562eb58efe34f3e575f7e19e03901de298ac87d020a84757b6e44bfe96512cecae4006e7c9a865ec34419eb28b803b', 'contact@auth.com', '2022-03-29 21:10:03'),
(38, '3fc8cee63bb26427eb2a7d528f2374d12ba93c81507fe5b03a79da0b682b4bea57f67ce9f4da73167a1effa0d648494c1123dc0084646631cc9b332ed578481a', 'john@doe.fr', '2022-03-29 21:10:22'),
(39, '290f7eabbf2a725371d98d9f2588b76440913ab636823b9db03d85271fc2c3b3d80c4e71a15dee2a5395d9f3ab5d19c955a4a4ae6cd6530e38f92f9026ad1b06', 'contact@auth.com', '2022-03-29 21:10:44'),
(40, '37d50be223271ec2605644fc3d03f7079ec4fdf820afd4e4411d385acf566596b08d886ffe946f5d27a8b3d44430dfbd7a4b09475cda29a3c7f55e0d04e50d1c', 'admin@auth.com', '2022-03-29 21:12:13');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'john@doe.fr', '[\"ROLE_ADMIN\"]', '$2y$13$/z4rzgvkNhw.7lzv/qsLxeX3wVMaMUHx.MUeSVuUNoIwOGrRH95ha'),
(9, 'test@test.com', '[\"ROLE_USER\"]', '$2y$13$4fyPfYvdY21F2R8082bwkeKl25TJMpxst1FQ5L.afDQ8iuf1j0oR6'),
(10, 'admin@auth.com', '[\"ROLE_ADMIN\", \"ROLE_USER\"]', '$2y$13$.HeyCUZhN8ug8CaHNxLyH.NjXPD9VzAm/FGbvUG4R0zi5yJn9DwEa');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `force_attacks`
--
ALTER TABLE `force_attacks`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9BACE7E1C74F2195` (`refresh_token`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `force_attacks`
--
ALTER TABLE `force_attacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
