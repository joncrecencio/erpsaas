-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08/04/2025 às 02:32
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `saas`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `abertura_caixas`
--

CREATE TABLE `abertura_caixas` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `valor` decimal(10,2) NOT NULL,
  `ultima_venda_nfe` int(11) NOT NULL DEFAULT 0,
  `primeira_venda_nfe` int(11) NOT NULL DEFAULT 0,
  `ultima_venda_nfce` int(11) NOT NULL DEFAULT 0,
  `primeira_venda_nfce` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `valor_dinheiro_caixa` decimal(10,2) NOT NULL DEFAULT 0.00,
  `filial_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `abertura_caixas`
--

INSERT INTO `abertura_caixas` (`id`, `empresa_id`, `usuario_id`, `data_registro`, `valor`, `ultima_venda_nfe`, `primeira_venda_nfe`, `ultima_venda_nfce`, `primeira_venda_nfce`, `status`, `valor_dinheiro_caixa`, `filial_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2025-01-18 20:15:36', 100.00, 3, 2, 0, 0, 1, 0.00, NULL, '2025-01-18 20:15:36', '2025-01-18 20:18:11'),
(2, 1, 3, '2025-01-18 20:59:54', 1.00, 7, 3, 7, 0, 1, 0.00, NULL, '2025-01-18 20:59:54', '2025-01-25 17:35:43'),
(3, 2, 6, '2025-01-25 17:30:25', 1.00, 0, 0, 8, 0, 1, 0.00, NULL, '2025-01-25 17:30:25', '2025-01-25 17:51:06'),
(4, 1, 2, '2025-01-25 17:35:53', 1.00, 7, 7, 10, 7, 1, 0.00, NULL, '2025-01-25 17:35:53', '2025-01-25 17:48:11'),
(5, 1, 3, '2025-01-25 17:48:35', 1.00, 7, 7, 11, 10, 1, 0.00, NULL, '2025-01-25 17:48:35', '2025-01-25 17:49:42'),
(6, 2, 5, '2025-01-25 17:51:14', 1.00, 0, 0, 12, 8, 1, 0.00, NULL, '2025-01-25 17:51:14', '2025-01-25 17:54:23'),
(7, 2, 5, '2025-01-25 17:57:57', 1.00, 9, 0, 18, 12, 1, 0.00, NULL, '2025-01-25 17:57:57', '2025-01-25 18:53:51'),
(8, 1, 3, '2025-01-25 18:05:39', 1.00, 7, 7, 13, 11, 1, 0.00, NULL, '2025-01-25 18:05:39', '2025-01-25 18:06:55'),
(9, 2, 5, '2025-01-25 19:00:16', 0.00, 9, 9, 19, 18, 1, 0.00, NULL, '2025-01-25 19:00:16', '2025-01-25 19:06:20'),
(10, 2, 6, '2025-01-25 19:06:32', 0.00, 0, 9, 0, 19, 0, 0.00, NULL, '2025-01-25 19:06:32', '2025-01-25 19:06:32'),
(11, 1, 2, '2025-01-29 18:25:37', 500.00, 0, 8, 0, 13, 0, 0.00, NULL, '2025-01-29 18:25:37', '2025-01-29 18:25:37');

-- --------------------------------------------------------

--
-- Estrutura para tabela `acessors`
--

CREATE TABLE `acessors` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `razao_social` varchar(100) NOT NULL,
  `cpf_cnpj` varchar(19) NOT NULL DEFAULT '000.000.000-00',
  `rua` varchar(80) NOT NULL,
  `ie_rg` varchar(20) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `celular` varchar(20) NOT NULL DEFAULT '00 00000 0000',
  `email` varchar(40) NOT NULL DEFAULT 'null',
  `cep` varchar(10) NOT NULL DEFAULT 'null',
  `percentual_comissao` decimal(6,2) NOT NULL DEFAULT 0.00,
  `data_registro` date NOT NULL,
  `funcionario_id` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendamentos`
--

CREATE TABLE `agendamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `funcionario_id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `data` date NOT NULL,
  `observacao` varchar(150) NOT NULL,
  `inicio` time NOT NULL,
  `termino` time NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `acrescimo` decimal(10,2) NOT NULL,
  `valor_comissao` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `alertas`
--

CREATE TABLE `alertas` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `texto` text NOT NULL,
  `prioridade` enum('baixa','media','alta') NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `alteracao_estoques`
--

CREATE TABLE `alteracao_estoques` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED DEFAULT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `observacao` varchar(200) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `alteracao_estoques`
--

INSERT INTO `alteracao_estoques` (`id`, `empresa_id`, `produto_id`, `usuario_id`, `quantidade`, `observacao`, `tipo`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 1.000, 'Venda', '0', '2025-01-18 19:50:38', '2025-01-18 19:50:38'),
(2, 1, 1, 2, 1.000, 'Perda', '0', '2025-01-29 18:23:54', '2025-01-29 18:23:54');

-- --------------------------------------------------------

--
-- Estrutura para tabela `apk_comandas`
--

CREATE TABLE `apk_comandas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome_arquivo` varchar(255) NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `apontamentos`
--

CREATE TABLE `apontamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED DEFAULT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `apontamentos`
--

INSERT INTO `apontamentos` (`id`, `empresa_id`, `produto_id`, `usuario_id`, `quantidade`, `data_registro`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 1.000, '2025-01-18 19:50:38', '2025-01-18 19:50:38', '2025-01-18 19:50:38'),
(2, 1, 1, 2, 1.000, '2025-01-29 18:23:53', '2025-01-29 18:23:53', '2025-01-29 18:23:53');

-- --------------------------------------------------------

--
-- Estrutura para tabela `apuracao_mensals`
--

CREATE TABLE `apuracao_mensals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `funcionario_id` int(10) UNSIGNED NOT NULL,
  `mes` varchar(20) NOT NULL,
  `ano` int(11) NOT NULL,
  `valor_final` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(30) NOT NULL,
  `observacao` varchar(100) NOT NULL,
  `conta_pagar_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `apuracao_salario_eventos`
--

CREATE TABLE `apuracao_salario_eventos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `apuracao_id` bigint(20) UNSIGNED DEFAULT NULL,
  `evento_id` bigint(20) UNSIGNED DEFAULT NULL,
  `valor` decimal(8,2) NOT NULL,
  `metodo` enum('informado','fixo') NOT NULL,
  `condicao` enum('soma','diminui') NOT NULL,
  `nome` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `atividade_eventos`
--

CREATE TABLE `atividade_eventos` (
  `id` int(10) UNSIGNED NOT NULL,
  `responsavel_nome` varchar(50) NOT NULL,
  `responsavel_telefone` varchar(15) NOT NULL,
  `crianca_nome` varchar(50) NOT NULL,
  `inicio` time NOT NULL,
  `fim` time NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `evento_id` int(10) UNSIGNED NOT NULL,
  `funcionario_id` int(10) UNSIGNED NOT NULL,
  `forma_pagamento` varchar(25) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `atividade_servicos`
--

CREATE TABLE `atividade_servicos` (
  `id` int(10) UNSIGNED NOT NULL,
  `servico_id` int(10) UNSIGNED NOT NULL,
  `atividade_id` int(10) UNSIGNED NOT NULL,
  `quantidade` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `autor_post_blog_ecommerces`
--

CREATE TABLE `autor_post_blog_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `img` varchar(40) NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bairro_deliveries`
--

CREATE TABLE `bairro_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) NOT NULL,
  `valor_entrega` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bairro_delivery_lojas`
--

CREATE TABLE `bairro_delivery_lojas` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) NOT NULL,
  `valor_entrega` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `banner_mais_vendidos`
--

CREATE TABLE `banner_mais_vendidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `path` varchar(100) NOT NULL,
  `texto_primario` varchar(20) NOT NULL,
  `texto_secundario` varchar(30) NOT NULL,
  `produto_delivery_id` int(10) UNSIGNED DEFAULT NULL,
  `pack_id` int(10) UNSIGNED DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `banner_topos`
--

CREATE TABLE `banner_topos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `path` varchar(100) NOT NULL,
  `titulo` varchar(20) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `produto_delivery_id` int(10) UNSIGNED DEFAULT NULL,
  `pack_id` int(10) UNSIGNED DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `boletos`
--

CREATE TABLE `boletos` (
  `id` int(10) UNSIGNED NOT NULL,
  `banco_id` int(10) UNSIGNED NOT NULL,
  `conta_id` int(10) UNSIGNED NOT NULL,
  `numero` varchar(10) NOT NULL,
  `numero_documento` varchar(10) NOT NULL,
  `carteira` varchar(10) NOT NULL,
  `convenio` varchar(20) NOT NULL,
  `linha_digitavel` varchar(50) NOT NULL,
  `nome_arquivo` varchar(40) NOT NULL,
  `juros` decimal(10,2) NOT NULL,
  `multa` decimal(10,2) NOT NULL,
  `juros_apos` int(11) NOT NULL,
  `instrucoes` varchar(100) NOT NULL,
  `tipo` varchar(7) NOT NULL,
  `logo` tinyint(1) NOT NULL DEFAULT 0,
  `posto` varchar(10) NOT NULL DEFAULT '',
  `codigo_cliente` varchar(10) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrossel_deliveries`
--

CREATE TABLE `carrossel_deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `path` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `valor_ordem` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrossel_ecommerces`
--

CREATE TABLE `carrossel_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `cor_titulo` varchar(7) NOT NULL DEFAULT '#000',
  `descricao` varchar(200) NOT NULL,
  `cor_descricao` varchar(7) NOT NULL DEFAULT '#000',
  `link_acao` varchar(200) NOT NULL,
  `nome_botao` varchar(20) NOT NULL,
  `img` varchar(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `empresa_id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 1, 'Software', '2025-01-18 19:36:11', '2025-01-18 19:36:11'),
(2, 1, 'Prestação de Serviço', '2025-01-18 21:27:22', '2025-01-18 21:27:22'),
(3, 1, 'Pizzas', '2025-01-19 03:13:04', '2025-01-19 03:13:04'),
(7, 2, 'Sorveteria', '2025-01-25 17:11:29', '2025-01-25 17:11:29'),
(9, 2, 'Picolé', '2025-01-25 17:19:28', '2025-01-25 17:19:28'),
(10, 1, 'AÇAI', '2025-01-29 18:44:36', '2025-01-29 18:44:36'),
(11, 3, 'Software', '2025-02-07 00:28:14', '2025-02-07 00:28:14'),
(12, 3, 'Prestação de Serviço', '2025-02-07 00:28:14', '2025-02-07 00:28:14'),
(13, 3, 'Pizzas', '2025-02-07 00:28:14', '2025-02-07 00:28:14'),
(14, 3, 'AÇAI', '2025-02-07 00:28:14', '2025-02-07 00:28:14');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria_contas`
--

CREATE TABLE `categoria_contas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `categoria_contas`
--

INSERT INTO `categoria_contas` (`id`, `nome`, `empresa_id`, `tipo`, `created_at`, `updated_at`) VALUES
(1, 'Compras', 1, 'pagar', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(2, 'Vendas', 1, 'receber', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(3, 'Compras', 2, 'pagar', '2025-01-25 17:03:00', '2025-01-25 17:03:00'),
(4, 'Vendas', 2, 'receber', '2025-01-25 17:03:00', '2025-01-25 17:03:00'),
(5, 'Compras', 3, 'pagar', '2025-02-07 00:28:13', '2025-02-07 00:28:13'),
(6, 'Vendas', 3, 'receber', '2025-02-07 00:28:13', '2025-02-07 00:28:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria_despesa_ctes`
--

CREATE TABLE `categoria_despesa_ctes` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria_destaque_master_deliveries`
--

CREATE TABLE `categoria_destaque_master_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria_empresas`
--

CREATE TABLE `categoria_empresas` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria_loja_segmentos`
--

CREATE TABLE `categoria_loja_segmentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `loja_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria_master_deliveries`
--

CREATE TABLE `categoria_master_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) NOT NULL,
  `img` varchar(80) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria_post_blog_ecommerces`
--

CREATE TABLE `categoria_post_blog_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria_produto_deliveries`
--

CREATE TABLE `categoria_produto_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) NOT NULL,
  `descricao` varchar(120) DEFAULT NULL,
  `path` varchar(80) NOT NULL,
  `tipo_pizza` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria_produto_ecommerces`
--

CREATE TABLE `categoria_produto_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) NOT NULL,
  `imagem` varchar(40) NOT NULL,
  `destaque` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria_servicos`
--

CREATE TABLE `categoria_servicos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `categoria_servicos`
--

INSERT INTO `categoria_servicos` (`id`, `empresa_id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 1, 'Correção', '2025-01-18 21:43:19', '2025-01-18 21:43:19'),
(2, 1, 'Inclusão', '2025-01-18 21:43:28', '2025-01-18 21:43:28'),
(3, 1, 'Exclusão', '2025-01-18 21:43:35', '2025-01-18 21:43:35'),
(4, 2, 'Fornecimento', '2025-01-25 18:14:20', '2025-01-25 18:14:20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `certificados`
--

CREATE TABLE `certificados` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `arquivo` blob NOT NULL,
  `senha` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `chave_nfe_ctes`
--

CREATE TABLE `chave_nfe_ctes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cte_id` int(10) UNSIGNED NOT NULL,
  `chave` varchar(44) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidades`
--

CREATE TABLE `cidades` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(8) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `cidades`
--

INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(1, '1100015', 'Alta Floresta D\'Oeste', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(2, '1100023', 'Ariquemes', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(3, '1100031', 'Cabixi', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(4, '1100049', 'Cacoal', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(5, '1100056', 'Cerejeiras', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(6, '1100064', 'Colorado do Oeste', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(7, '1100072', 'Corumbiara', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(8, '1100080', 'Costa Marques', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(9, '1100098', 'Espigão D\'Oeste', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(10, '1100106', 'Guajará-Mirim', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(11, '1100114', 'Jaru', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(12, '1100122', 'Ji-Paraná', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(13, '1100130', 'Machadinho D\'Oeste', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(14, '1100148', 'Nova Brasilândia D\'Oeste', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(15, '1100155', 'Ouro Preto do Oeste', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(16, '1100189', 'Pimenta Bueno', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(17, '1100205', 'Porto Velho', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(18, '1100254', 'Presidente Médici', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(19, '1100262', 'Rio Crespo', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(20, '1100288', 'Rolim de Moura', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(21, '1100296', 'Santa Luzia D\'Oeste', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(22, '1100304', 'Vilhena', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(23, '1100320', 'São Miguel do Guaporé', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(24, '1100338', 'Nova Mamoré', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(25, '1100346', 'Alvorada D\'Oeste', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(26, '1100379', 'Alto Alegre dos Parecis', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(27, '1100403', 'Alto Paraíso', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(28, '1100452', 'Buritis', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(29, '1100502', 'Novo Horizonte do Oeste', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(30, '1100601', 'Cacaulândia', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(31, '1100700', 'Campo Novo de Rondônia', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(32, '1100809', 'Candeias do Jamari', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(33, '1100908', 'Castanheiras', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(34, '1100924', 'Chupinguaia', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(35, '1100940', 'Cujubim', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(36, '1101005', 'Governador Jorge Teixeira', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(37, '1101104', 'Itapuã do Oeste', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(38, '1101203', 'Ministro Andreazza', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(39, '1101302', 'Mirante da Serra', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(40, '1101401', 'Monte Negro', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(41, '1101435', 'Nova União', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(42, '1101450', 'Parecis', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(43, '1101468', 'Pimenteiras do Oeste', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(44, '1101476', 'Primavera de Rondônia', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(45, '1101484', 'São Felipe D\'Oeste', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(46, '1101492', 'São Francisco do Guaporé', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(47, '1101500', 'Seringueiras', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(48, '1101559', 'Teixeirópolis', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(49, '1101609', 'Theobroma', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(50, '1101708', 'Urupá', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(51, '1101757', 'Vale do Anari', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(52, '1101807', 'Vale do Paraíso', 'RO', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(53, '1200013', 'Acrelândia', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(54, '1200054', 'Assis Brasil', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(55, '1200104', 'Brasiléia', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(56, '1200138', 'Bujari', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(57, '1200179', 'Capixaba', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(58, '1200203', 'Cruzeiro do Sul', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(59, '1200252', 'Epitaciolândia', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(60, '1200302', 'Feijó', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(61, '1200328', 'Jordão', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(62, '1200336', 'Mâncio Lima', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(63, '1200344', 'Manoel Urbano', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(64, '1200351', 'Marechal Thaumaturgo', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(65, '1200385', 'Plácido de Castro', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(66, '1200393', 'Porto Walter', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(67, '1200401', 'Rio Branco', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(68, '1200427', 'Rodrigues Alves', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(69, '1200435', 'Santa Rosa do Purus', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(70, '1200450', 'Senador Guiomard', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(71, '1200500', 'Sena Madureira', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(72, '1200609', 'Tarauacá', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(73, '1200708', 'Xapuri', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(74, '1200807', 'Porto Acre', 'AC', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(75, '1300029', 'Alvarães', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(76, '1300060', 'Amaturá', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(77, '1300086', 'Anamã', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(78, '1300102', 'Anori', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(79, '1300144', 'Apuí', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(80, '1300201', 'Atalaia do Norte', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(81, '1300300', 'Autazes', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(82, '1300409', 'Barcelos', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(83, '1300508', 'Barreirinha', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(84, '1300607', 'Benjamin Constant', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(85, '1300631', 'Beruri', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(86, '1300680', 'Boa Vista do Ramos', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(87, '1300706', 'Boca do Acre', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(88, '1300805', 'Borba', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(89, '1300839', 'Caapiranga', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(90, '1300904', 'Canutama', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(91, '1301001', 'Carauari', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(92, '1301100', 'Careiro', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(93, '1301159', 'Careiro da Várzea', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(94, '1301209', 'Coari', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(95, '1301308', 'Codajás', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(96, '1301407', 'Eirunepé', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(97, '1301506', 'Envira', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(98, '1301605', 'Fonte Boa', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(99, '1301654', 'Guajará', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(100, '1301704', 'Humaitá', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(101, '1301803', 'Ipixuna', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(102, '1301852', 'Iranduba', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(103, '1301902', 'Itacoatiara', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(104, '1301951', 'Itamarati', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(105, '1302009', 'Itapiranga', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(106, '1302108', 'Japurá', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(107, '1302207', 'Juruá', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(108, '1302306', 'Jutaí', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(109, '1302405', 'Lábrea', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(110, '1302504', 'Manacapuru', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(111, '1302553', 'Manaquiri', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(112, '1302603', 'Manaus', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(113, '1302702', 'Manicoré', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(114, '1302801', 'Maraã', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(115, '1302900', 'Maués', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(116, '1303007', 'Nhamundá', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(117, '1303106', 'Nova Olinda do Norte', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(118, '1303205', 'Novo Airão', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(119, '1303304', 'Novo Aripuanã', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(120, '1303403', 'Parintins', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(121, '1303502', 'Pauini', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(122, '1303536', 'Presidente Figueiredo', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(123, '1303569', 'Rio Preto da Eva', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(124, '1303601', 'Santa Isabel do Rio Negro', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(125, '1303700', 'Santo Antônio do Içá', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(126, '1303809', 'São Gabriel da Cachoeira', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(127, '1303908', 'São Paulo de Olivença', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(128, '1303957', 'São Sebastião do Uatumã', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(129, '1304005', 'Silves', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(130, '1304062', 'Tabatinga', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(131, '1304104', 'Tapauá', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(132, '1304203', 'Tefé', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(133, '1304237', 'Tonantins', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(134, '1304260', 'Uarini', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(135, '1304302', 'Urucará', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(136, '1304401', 'Urucurituba', 'AM', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(137, '1400027', 'Amajari', 'RR', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(138, '1400050', 'Alto Alegre', 'RR', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(139, '1400100', 'Boa Vista', 'RR', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(140, '1400159', 'Bonfim', 'RR', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(141, '1400175', 'Cantá', 'RR', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(142, '1400209', 'Caracaraí', 'RR', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(143, '1400233', 'Caroebe', 'RR', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(144, '1400282', 'Iracema', 'RR', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(145, '1400308', 'Mucajaí', 'RR', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(146, '1400407', 'Normandia', 'RR', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(147, '1400456', 'Pacaraima', 'RR', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(148, '1400472', 'Rorainópolis', 'RR', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(149, '1400506', 'São João da Baliza', 'RR', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(150, '1400605', 'São Luiz', 'RR', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(151, '1400704', 'Uiramutã', 'RR', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(152, '1500107', 'Abaetetuba', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(153, '1500131', 'Abel Figueiredo', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(154, '1500206', 'Acará', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(155, '1500305', 'Afuá', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(156, '1500347', 'Água Azul do Norte', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(157, '1500404', 'Alenquer', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(158, '1500503', 'Almeirim', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(159, '1500602', 'Altamira', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(160, '1500701', 'Anajás', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(161, '1500800', 'Ananindeua', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(162, '1500859', 'Anapu', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(163, '1500909', 'Augusto Corrêa', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(164, '1500958', 'Aurora do Pará', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(165, '1501006', 'Aveiro', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(166, '1501105', 'Bagre', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(167, '1501204', 'Baião', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(168, '1501253', 'Bannach', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(169, '1501303', 'Barcarena', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(170, '1501402', 'Belém', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(171, '1501451', 'Belterra', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(172, '1501501', 'Benevides', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(173, '1501576', 'Bom Jesus do Tocantins', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(174, '1501600', 'Bonito', 'PA', '2024-06-14 16:38:59', '2024-06-14 16:38:59'),
(175, '1501709', 'Bragança', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(176, '1501725', 'Brasil Novo', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(177, '1501758', 'Brejo Grande do Araguaia', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(178, '1501782', 'Breu Branco', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(179, '1501808', 'Breves', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(180, '1501907', 'Bujaru', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(181, '1501956', 'Cachoeira do Piriá', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(182, '1502004', 'Cachoeira do Arari', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(183, '1502103', 'Cametá', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(184, '1502152', 'Canaã dos Carajás', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(185, '1502202', 'Capanema', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(186, '1502301', 'Capitão Poço', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(187, '1502400', 'Castanhal', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(188, '1502509', 'Chaves', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(189, '1502608', 'Colares', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(190, '1502707', 'Conceição do Araguaia', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(191, '1502756', 'Concórdia do Pará', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(192, '1502764', 'Cumaru do Norte', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(193, '1502772', 'Curionópolis', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(194, '1502806', 'Curralinho', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(195, '1502855', 'Curuá', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(196, '1502905', 'Curuçá', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(197, '1502939', 'Dom Eliseu', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(198, '1502954', 'Eldorado dos Carajás', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(199, '1503002', 'Faro', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(200, '1503044', 'Floresta do Araguaia', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(201, '1503077', 'Garrafão do Norte', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(202, '1503093', 'Goianésia do Pará', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(203, '1503101', 'Gurupá', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(204, '1503200', 'Igarapé-Açu', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(205, '1503309', 'Igarapé-Miri', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(206, '1503408', 'Inhangapi', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(207, '1503457', 'Ipixuna do Pará', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(208, '1503507', 'Irituia', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(209, '1503606', 'Itaituba', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(210, '1503705', 'Itupiranga', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(211, '1503754', 'Jacareacanga', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(212, '1503804', 'Jacundá', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(213, '1503903', 'Juruti', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(214, '1504000', 'Limoeiro do Ajuru', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(215, '1504059', 'Mãe do Rio', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(216, '1504109', 'Magalhães Barata', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(217, '1504208', 'Marabá', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(218, '1504307', 'Maracanã', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(219, '1504406', 'Marapanim', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(220, '1504422', 'Marituba', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(221, '1504455', 'Medicilândia', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(222, '1504505', 'Melgaço', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(223, '1504604', 'Mocajuba', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(224, '1504703', 'Moju', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(225, '1504752', 'Mojuí dos Campos', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(226, '1504802', 'Monte Alegre', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(227, '1504901', 'Muaná', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(228, '1504950', 'Nova Esperança do Piriá', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(229, '1504976', 'Nova Ipixuna', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(230, '1505007', 'Nova Timboteua', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(231, '1505031', 'Novo Progresso', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(232, '1505064', 'Novo Repartimento', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(233, '1505106', 'Óbidos', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(234, '1505205', 'Oeiras do Pará', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(235, '1505304', 'Oriximiná', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(236, '1505403', 'Ourém', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(237, '1505437', 'Ourilândia do Norte', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(238, '1505486', 'Pacajá', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(239, '1505494', 'Palestina do Pará', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(240, '1505502', 'Paragominas', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(241, '1505536', 'Parauapebas', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(242, '1505551', 'Pau D\'Arco', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(243, '1505601', 'Peixe-Boi', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(244, '1505635', 'Piçarra', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(245, '1505650', 'Placas', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(246, '1505700', 'Ponta de Pedras', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(247, '1505809', 'Portel', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(248, '1505908', 'Porto de Moz', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(249, '1506005', 'Prainha', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(250, '1506104', 'Primavera', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(251, '1506112', 'Quatipuru', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(252, '1506138', 'Redenção', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(253, '1506161', 'Rio Maria', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(254, '1506187', 'Rondon do Pará', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(255, '1506195', 'Rurópolis', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(256, '1506203', 'Salinópolis', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(257, '1506302', 'Salvaterra', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(258, '1506351', 'Santa Bárbara do Pará', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(259, '1506401', 'Santa Cruz do Arari', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(260, '1506500', 'Santa Isabel do Pará', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(261, '1506559', 'Santa Luzia do Pará', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(262, '1506583', 'Santa Maria das Barreiras', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(263, '1506609', 'Santa Maria do Pará', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(264, '1506708', 'Santana do Araguaia', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(265, '1506807', 'Santarém', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(266, '1506906', 'Santarém Novo', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(267, '1507003', 'Santo Antônio do Tauá', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(268, '1507102', 'São Caetano de Odivelas', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(269, '1507151', 'São Domingos do Araguaia', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(270, '1507201', 'São Domingos do Capim', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(271, '1507300', 'São Félix do Xingu', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(272, '1507409', 'São Francisco do Pará', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(273, '1507458', 'São Geraldo do Araguaia', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(274, '1507466', 'São João da Ponta', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(275, '1507474', 'São João de Pirabas', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(276, '1507508', 'São João do Araguaia', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(277, '1507607', 'São Miguel do Guamá', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(278, '1507706', 'São Sebastião da Boa Vista', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(279, '1507755', 'Sapucaia', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(280, '1507805', 'Senador José Porfírio', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(281, '1507904', 'Soure', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(282, '1507953', 'Tailândia', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(283, '1507961', 'Terra Alta', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(284, '1507979', 'Terra Santa', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(285, '1508001', 'Tomé-Açu', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(286, '1508035', 'Tracuateua', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(287, '1508050', 'Trairão', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(288, '1508084', 'Tucumã', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(289, '1508100', 'Tucuruí', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(290, '1508126', 'Ulianópolis', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(291, '1508159', 'Uruará', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(292, '1508209', 'Vigia', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(293, '1508308', 'Viseu', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(294, '1508357', 'Vitória do Xingu', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(295, '1508407', 'Xinguara', 'PA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(296, '1600055', 'Serra do Navio', 'AP', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(297, '1600105', 'Amapá', 'AP', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(298, '1600154', 'Pedra Branca do Amapari', 'AP', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(299, '1600204', 'Calçoene', 'AP', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(300, '1600212', 'Cutias', 'AP', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(301, '1600238', 'Ferreira Gomes', 'AP', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(302, '1600253', 'Itaubal', 'AP', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(303, '1600279', 'Laranjal do Jari', 'AP', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(304, '1600303', 'Macapá', 'AP', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(305, '1600402', 'Mazagão', 'AP', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(306, '1600501', 'Oiapoque', 'AP', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(307, '1600535', 'Porto Grande', 'AP', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(308, '1600550', 'Pracuúba', 'AP', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(309, '1600600', 'Santana', 'AP', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(310, '1600709', 'Tartarugalzinho', 'AP', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(311, '1600808', 'Vitória do Jari', 'AP', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(312, '1700251', 'Abreulândia', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(313, '1700301', 'Aguiarnópolis', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(314, '1700350', 'Aliança do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(315, '1700400', 'Almas', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(316, '1700707', 'Alvorada', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(317, '1701002', 'Ananás', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(318, '1701051', 'Angico', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(319, '1701101', 'Aparecida do Rio Negro', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(320, '1701309', 'Aragominas', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(321, '1701903', 'Araguacema', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(322, '1702000', 'Araguaçu', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(323, '1702109', 'Araguaína', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(324, '1702158', 'Araguanã', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(325, '1702208', 'Araguatins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(326, '1702307', 'Arapoema', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(327, '1702406', 'Arraias', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(328, '1702554', 'Augustinópolis', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(329, '1702703', 'Aurora do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(330, '1702901', 'Axixá do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(331, '1703008', 'Babaçulândia', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(332, '1703057', 'Bandeirantes do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(333, '1703073', 'Barra do Ouro', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(334, '1703107', 'Barrolândia', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(335, '1703206', 'Bernardo Sayão', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(336, '1703305', 'Bom Jesus do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(337, '1703602', 'Brasilândia do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(338, '1703701', 'Brejinho de Nazaré', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(339, '1703800', 'Buriti do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(340, '1703826', 'Cachoeirinha', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(341, '1703842', 'Campos Lindos', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(342, '1703867', 'Cariri do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(343, '1703883', 'Carmolândia', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(344, '1703891', 'Carrasco Bonito', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(345, '1703909', 'Caseara', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(346, '1704105', 'Centenário', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(347, '1704600', 'Chapada de Areia', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(348, '1705102', 'Chapada da Natividade', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(349, '1705508', 'Colinas do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(350, '1705557', 'Combinado', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(351, '1705607', 'Conceição do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(352, '1706001', 'Couto Magalhães', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(353, '1706100', 'Cristalândia', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(354, '1706258', 'Crixás do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(355, '1706506', 'Darcinópolis', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(356, '1707009', 'Dianópolis', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(357, '1707108', 'Divinópolis do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(358, '1707207', 'Dois Irmãos do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(359, '1707306', 'Dueré', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(360, '1707405', 'Esperantina', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(361, '1707553', 'Fátima', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(362, '1707652', 'Figueirópolis', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(363, '1707702', 'Filadélfia', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(364, '1708205', 'Formoso do Araguaia', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(365, '1708254', 'Fortaleza do Tabocão', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(366, '1708304', 'Goianorte', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(367, '1709005', 'Goiatins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(368, '1709302', 'Guaraí', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(369, '1709500', 'Gurupi', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(370, '1709807', 'Ipueiras', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(371, '1710508', 'Itacajá', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(372, '1710706', 'Itaguatins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(373, '1710904', 'Itapiratins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(374, '1711100', 'Itaporã do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(375, '1711506', 'Jaú do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(376, '1711803', 'Juarina', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(377, '1711902', 'Lagoa da Confusão', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(378, '1711951', 'Lagoa do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(379, '1712009', 'Lajeado', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(380, '1712157', 'Lavandeira', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(381, '1712405', 'Lizarda', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(382, '1712454', 'Luzinópolis', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(383, '1712504', 'Marianópolis do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(384, '1712702', 'Mateiros', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(385, '1712801', 'Maurilândia do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(386, '1713205', 'Miracema do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(387, '1713304', 'Miranorte', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(388, '1713601', 'Monte do Carmo', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(389, '1713700', 'Monte Santo do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(390, '1713809', 'Palmeiras do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(391, '1713957', 'Muricilândia', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(392, '1714203', 'Natividade', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(393, '1714302', 'Nazaré', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(394, '1714880', 'Nova Olinda', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(395, '1715002', 'Nova Rosalândia', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(396, '1715101', 'Novo Acordo', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(397, '1715150', 'Novo Alegre', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(398, '1715259', 'Novo Jardim', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(399, '1715507', 'Oliveira de Fátima', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(400, '1715705', 'Palmeirante', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(401, '1715754', 'Palmeirópolis', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(402, '1716109', 'Paraíso do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(403, '1716208', 'Paranã', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(404, '1716307', 'Pau D\'Arco', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(405, '1716505', 'Pedro Afonso', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(406, '1716604', 'Peixe', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(407, '1716653', 'Pequizeiro', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(408, '1716703', 'Colméia', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(409, '1717008', 'Pindorama do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(410, '1717206', 'Piraquê', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(411, '1717503', 'Pium', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(412, '1717800', 'Ponte Alta do Bom Jesus', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(413, '1717909', 'Ponte Alta do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(414, '1718006', 'Porto Alegre do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(415, '1718204', 'Porto Nacional', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(416, '1718303', 'Praia Norte', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(417, '1718402', 'Presidente Kennedy', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(418, '1718451', 'Pugmil', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(419, '1718501', 'Recursolândia', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(420, '1718550', 'Riachinho', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(421, '1718659', 'Rio da Conceição', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(422, '1718709', 'Rio dos Bois', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(423, '1718758', 'Rio Sono', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(424, '1718808', 'Sampaio', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(425, '1718840', 'Sandolândia', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(426, '1718865', 'Santa Fé do Araguaia', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(427, '1718881', 'Santa Maria do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(428, '1718899', 'Santa Rita do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(429, '1718907', 'Santa Rosa do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(430, '1719004', 'Santa Tereza do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(431, '1720002', 'Santa Terezinha do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(432, '1720101', 'São Bento do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(433, '1720150', 'São Félix do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(434, '1720200', 'São Miguel do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(435, '1720259', 'São Salvador do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(436, '1720309', 'São Sebastião do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(437, '1720499', 'São Valério', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(438, '1720655', 'Silvanópolis', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(439, '1720804', 'Sítio Novo do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(440, '1720853', 'Sucupira', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(441, '1720903', 'Taguatinga', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(442, '1720937', 'Taipas do Tocantins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(443, '1720978', 'Talismã', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(444, '1721000', 'Palmas', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(445, '1721109', 'Tocantínia', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(446, '1721208', 'Tocantinópolis', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(447, '1721257', 'Tupirama', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(448, '1721307', 'Tupiratins', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(449, '1722081', 'Wanderlândia', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(450, '1722107', 'Xambioá', 'TO', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(451, '2100055', 'Açailândia', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(452, '2100105', 'Afonso Cunha', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(453, '2100154', 'Água Doce do Maranhão', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(454, '2100204', 'Alcântara', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(455, '2100303', 'Aldeias Altas', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(456, '2100402', 'Altamira do Maranhão', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(457, '2100436', 'Alto Alegre do Maranhão', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(458, '2100477', 'Alto Alegre do Pindaré', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(459, '2100501', 'Alto Parnaíba', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(460, '2100550', 'Amapá do Maranhão', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(461, '2100600', 'Amarante do Maranhão', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(462, '2100709', 'Anajatuba', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(463, '2100808', 'Anapurus', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(464, '2100832', 'Apicum-Açu', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(465, '2100873', 'Araguanã', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(466, '2100907', 'Araioses', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(467, '2100956', 'Arame', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(468, '2101004', 'Arari', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(469, '2101103', 'Axixá', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(470, '2101202', 'Bacabal', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(471, '2101251', 'Bacabeira', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(472, '2101301', 'Bacuri', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(473, '2101350', 'Bacurituba', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(474, '2101400', 'Balsas', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(475, '2101509', 'Barão de Grajaú', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(476, '2101608', 'Barra do Corda', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(477, '2101707', 'Barreirinhas', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(478, '2101731', 'Belágua', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(479, '2101772', 'Bela Vista do Maranhão', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(480, '2101806', 'Benedito Leite', 'MA', '2024-06-14 16:39:00', '2024-06-14 16:39:00'),
(481, '2101905', 'Bequimão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(482, '2101939', 'Bernardo do Mearim', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(483, '2101970', 'Boa Vista do Gurupi', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(484, '2102002', 'Bom Jardim', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(485, '2102036', 'Bom Jesus das Selvas', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(486, '2102077', 'Bom Lugar', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(487, '2102101', 'Brejo', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(488, '2102150', 'Brejo de Areia', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(489, '2102200', 'Buriti', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(490, '2102309', 'Buriti Bravo', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(491, '2102325', 'Buriticupu', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(492, '2102358', 'Buritirana', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(493, '2102374', 'Cachoeira Grande', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(494, '2102408', 'Cajapió', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(495, '2102507', 'Cajari', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(496, '2102556', 'Campestre do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(497, '2102606', 'Cândido Mendes', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(498, '2102705', 'Cantanhede', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(499, '2102754', 'Capinzal do Norte', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(500, '2102804', 'Carolina', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(501, '2102903', 'Carutapera', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(502, '2103000', 'Caxias', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(503, '2103109', 'Cedral', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(504, '2103125', 'Central do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(505, '2103158', 'Centro do Guilherme', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(506, '2103174', 'Centro Novo do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(507, '2103208', 'Chapadinha', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(508, '2103257', 'Cidelândia', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(509, '2103307', 'Codó', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(510, '2103406', 'Coelho Neto', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(511, '2103505', 'Colinas', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(512, '2103554', 'Conceição do Lago-Açu', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(513, '2103604', 'Coroatá', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(514, '2103703', 'Cururupu', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(515, '2103752', 'Davinópolis', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(516, '2103802', 'Dom Pedro', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(517, '2103901', 'Duque Bacelar', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(518, '2104008', 'Esperantinópolis', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(519, '2104057', 'Estreito', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(520, '2104073', 'Feira Nova do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(521, '2104081', 'Fernando Falcão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(522, '2104099', 'Formosa da Serra Negra', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(523, '2104107', 'Fortaleza dos Nogueiras', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(524, '2104206', 'Fortuna', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(525, '2104305', 'Godofredo Viana', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(526, '2104404', 'Gonçalves Dias', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(527, '2104503', 'Governador Archer', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(528, '2104552', 'Governador Edison Lobão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(529, '2104602', 'Governador Eugênio Barros', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(530, '2104628', 'Governador Luiz Rocha', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(531, '2104651', 'Governador Newton Bello', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(532, '2104677', 'Governador Nunes Freire', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(533, '2104701', 'Graça Aranha', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(534, '2104800', 'Grajaú', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(535, '2104909', 'Guimarães', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(536, '2105005', 'Humberto de Campos', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(537, '2105104', 'Icatu', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(538, '2105153', 'Igarapé do Meio', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(539, '2105203', 'Igarapé Grande', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(540, '2105302', 'Imperatriz', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(541, '2105351', 'Itaipava do Grajaú', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(542, '2105401', 'Itapecuru Mirim', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(543, '2105427', 'Itinga do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(544, '2105450', 'Jatobá', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(545, '2105476', 'Jenipapo dos Vieiras', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(546, '2105500', 'João Lisboa', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(547, '2105609', 'Joselândia', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(548, '2105658', 'Junco do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(549, '2105708', 'Lago da Pedra', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(550, '2105807', 'Lago do Junco', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(551, '2105906', 'Lago Verde', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(552, '2105922', 'Lagoa do Mato', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(553, '2105948', 'Lago dos Rodrigues', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(554, '2105963', 'Lagoa Grande do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(555, '2105989', 'Lajeado Novo', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(556, '2106003', 'Lima Campos', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(557, '2106102', 'Loreto', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(558, '2106201', 'Luís Domingues', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(559, '2106300', 'Magalhães de Almeida', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(560, '2106326', 'Maracaçumé', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(561, '2106359', 'Marajá do Sena', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(562, '2106375', 'Maranhãozinho', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(563, '2106409', 'Mata Roma', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(564, '2106508', 'Matinha', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(565, '2106607', 'Matões', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(566, '2106631', 'Matões do Norte', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(567, '2106672', 'Milagres do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(568, '2106706', 'Mirador', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(569, '2106755', 'Miranda do Norte', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(570, '2106805', 'Mirinzal', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(571, '2106904', 'Monção', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(572, '2107001', 'Montes Altos', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(573, '2107100', 'Morros', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(574, '2107209', 'Nina Rodrigues', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(575, '2107258', 'Nova Colinas', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(576, '2107308', 'Nova Iorque', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(577, '2107357', 'Nova Olinda do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(578, '2107407', 'Olho D\'Água das Cunhãs', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(579, '2107456', 'Olinda Nova do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(580, '2107506', 'Paço do Lumiar', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(581, '2107605', 'Palmeirândia', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(582, '2107704', 'Paraibano', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(583, '2107803', 'Parnarama', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(584, '2107902', 'Passagem Franca', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(585, '2108009', 'Pastos Bons', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(586, '2108058', 'Paulino Neves', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(587, '2108108', 'Paulo Ramos', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(588, '2108207', 'Pedreiras', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(589, '2108256', 'Pedro do Rosário', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(590, '2108306', 'Penalva', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(591, '2108405', 'Peri Mirim', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(592, '2108454', 'Peritoró', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(593, '2108504', 'Pindaré-Mirim', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(594, '2108603', 'Pinheiro', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(595, '2108702', 'Pio XII', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(596, '2108801', 'Pirapemas', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(597, '2108900', 'Poção de Pedras', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(598, '2109007', 'Porto Franco', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(599, '2109056', 'Porto Rico do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(600, '2109106', 'Presidente Dutra', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(601, '2109205', 'Presidente Juscelino', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(602, '2109239', 'Presidente Médici', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(603, '2109270', 'Presidente Sarney', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(604, '2109304', 'Presidente Vargas', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(605, '2109403', 'Primeira Cruz', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(606, '2109452', 'Raposa', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(607, '2109502', 'Riachão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(608, '2109551', 'Ribamar Fiquene', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(609, '2109601', 'Rosário', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(610, '2109700', 'Sambaíba', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(611, '2109759', 'Santa Filomena do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(612, '2109809', 'Santa Helena', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(613, '2109908', 'Santa Inês', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(614, '2110005', 'Santa Luzia', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(615, '2110039', 'Santa Luzia do Paruá', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(616, '2110104', 'Santa Quitéria do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(617, '2110203', 'Santa Rita', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(618, '2110237', 'Santana do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(619, '2110278', 'Santo Amaro do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(620, '2110302', 'Santo Antônio dos Lopes', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(621, '2110401', 'São Benedito do Rio Preto', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(622, '2110500', 'São Bento', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(623, '2110609', 'São Bernardo', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(624, '2110658', 'São Domingos do Azeitão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(625, '2110708', 'São Domingos do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(626, '2110807', 'São Félix de Balsas', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(627, '2110856', 'São Francisco do Brejão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(628, '2110906', 'São Francisco do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(629, '2111003', 'São João Batista', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(630, '2111029', 'São João do Carú', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(631, '2111052', 'São João do Paraíso', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(632, '2111078', 'São João do Soter', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(633, '2111102', 'São João dos Patos', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(634, '2111201', 'São José de Ribamar', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(635, '2111250', 'São José dos Basílios', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(636, '2111300', 'São Luís', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(637, '2111409', 'São Luís Gonzaga do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(638, '2111508', 'São Mateus do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(639, '2111532', 'São Pedro da Água Branca', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(640, '2111573', 'São Pedro dos Crentes', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(641, '2111607', 'São Raimundo das Mangabeiras', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(642, '2111631', 'São Raimundo do Doca Bezerra', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(643, '2111672', 'São Roberto', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(644, '2111706', 'São Vicente Ferrer', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(645, '2111722', 'Satubinha', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(646, '2111748', 'Senador Alexandre Costa', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(647, '2111763', 'Senador La Rocque', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(648, '2111789', 'Serrano do Maranhão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(649, '2111805', 'Sítio Novo', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(650, '2111904', 'Sucupira do Norte', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(651, '2111953', 'Sucupira do Riachão', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(652, '2112001', 'Tasso Fragoso', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(653, '2112100', 'Timbiras', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(654, '2112209', 'Timon', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(655, '2112233', 'Trizidela do Vale', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(656, '2112274', 'Tufilândia', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(657, '2112308', 'Tuntum', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(658, '2112407', 'Turiaçu', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(659, '2112456', 'Turilândia', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(660, '2112506', 'Tutóia', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(661, '2112605', 'Urbano Santos', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(662, '2112704', 'Vargem Grande', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(663, '2112803', 'Viana', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(664, '2112852', 'Vila Nova dos Martírios', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(665, '2112902', 'Vitória do Mearim', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(666, '2113009', 'Vitorino Freire', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(667, '2114007', 'Zé Doca', 'MA', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(668, '2200053', 'Acauã', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(669, '2200103', 'Agricolândia', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(670, '2200202', 'Água Branca', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(671, '2200251', 'Alagoinha do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(672, '2200277', 'Alegrete do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(673, '2200301', 'Alto Longá', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(674, '2200400', 'Altos', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(675, '2200459', 'Alvorada do Gurguéia', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(676, '2200509', 'Amarante', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(677, '2200608', 'Angical do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(678, '2200707', 'Anísio de Abreu', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(679, '2200806', 'Antônio Almeida', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(680, '2200905', 'Aroazes', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(681, '2200954', 'Aroeiras do Itaim', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(682, '2201002', 'Arraial', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(683, '2201051', 'Assunção do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(684, '2201101', 'Avelino Lopes', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(685, '2201150', 'Baixa Grande do Ribeiro', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(686, '2201176', 'Barra D\'Alcântara', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(687, '2201200', 'Barras', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(688, '2201309', 'Barreiras do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(689, '2201408', 'Barro Duro', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(690, '2201507', 'Batalha', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(691, '2201556', 'Bela Vista do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(692, '2201572', 'Belém do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(693, '2201606', 'Beneditinos', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(694, '2201705', 'Bertolínia', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(695, '2201739', 'Betânia do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(696, '2201770', 'Boa Hora', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(697, '2201804', 'Bocaina', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(698, '2201903', 'Bom Jesus', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(699, '2201919', 'Bom Princípio do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(700, '2201929', 'Bonfim do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(701, '2201945', 'Boqueirão do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(702, '2201960', 'Brasileira', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(703, '2201988', 'Brejo do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(704, '2202000', 'Buriti dos Lopes', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(705, '2202026', 'Buriti dos Montes', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(706, '2202059', 'Cabeceiras do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(707, '2202075', 'Cajazeiras do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(708, '2202083', 'Cajueiro da Praia', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(709, '2202091', 'Caldeirão Grande do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(710, '2202109', 'Campinas do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(711, '2202117', 'Campo Alegre do Fidalgo', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(712, '2202133', 'Campo Grande do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(713, '2202174', 'Campo Largo do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(714, '2202208', 'Campo Maior', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(715, '2202251', 'Canavieira', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(716, '2202307', 'Canto do Buriti', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(717, '2202406', 'Capitão de Campos', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(718, '2202455', 'Capitão Gervásio Oliveira', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(719, '2202505', 'Caracol', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(720, '2202539', 'Caraúbas do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(721, '2202554', 'Caridade do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(722, '2202604', 'Castelo do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(723, '2202653', 'Caxingó', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(724, '2202703', 'Cocal', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(725, '2202711', 'Cocal de Telha', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(726, '2202729', 'Cocal dos Alves', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(727, '2202737', 'Coivaras', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(728, '2202752', 'Colônia do Gurguéia', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(729, '2202778', 'Colônia do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(730, '2202802', 'Conceição do Canindé', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(731, '2202851', 'Coronel José Dias', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(732, '2202901', 'Corrente', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(733, '2203008', 'Cristalândia do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(734, '2203107', 'Cristino Castro', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(735, '2203206', 'Curimatá', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(736, '2203230', 'Currais', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(737, '2203255', 'Curralinhos', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(738, '2203271', 'Curral Novo do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(739, '2203305', 'Demerval Lobão', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(740, '2203354', 'Dirceu Arcoverde', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(741, '2203404', 'Dom Expedito Lopes', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(742, '2203420', 'Domingos Mourão', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(743, '2203453', 'Dom Inocêncio', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(744, '2203503', 'Elesbão Veloso', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(745, '2203602', 'Eliseu Martins', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(746, '2203701', 'Esperantina', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(747, '2203750', 'Fartura do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(748, '2203800', 'Flores do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(749, '2203859', 'Floresta do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(750, '2203909', 'Floriano', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(751, '2204006', 'Francinópolis', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(752, '2204105', 'Francisco Ayres', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(753, '2204154', 'Francisco Macedo', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(754, '2204204', 'Francisco Santos', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(755, '2204303', 'Fronteiras', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(756, '2204352', 'Geminiano', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(757, '2204402', 'Gilbués', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(758, '2204501', 'Guadalupe', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(759, '2204550', 'Guaribas', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(760, '2204600', 'Hugo Napoleão', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(761, '2204659', 'Ilha Grande', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(762, '2204709', 'Inhuma', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(763, '2204808', 'Ipiranga do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(764, '2204907', 'Isaías Coelho', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(765, '2205003', 'Itainópolis', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(766, '2205102', 'Itaueira', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(767, '2205151', 'Jacobina do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(768, '2205201', 'Jaicós', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(769, '2205250', 'Jardim do Mulato', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(770, '2205276', 'Jatobá do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(771, '2205300', 'Jerumenha', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(772, '2205359', 'João Costa', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(773, '2205409', 'Joaquim Pires', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(774, '2205458', 'Joca Marques', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(775, '2205508', 'José de Freitas', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(776, '2205516', 'Juazeiro do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(777, '2205524', 'Júlio Borges', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(778, '2205532', 'Jurema', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(779, '2205540', 'Lagoinha do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(780, '2205557', 'Lagoa Alegre', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(781, '2205565', 'Lagoa do Barro do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(782, '2205573', 'Lagoa de São Francisco', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(783, '2205581', 'Lagoa do Piauí', 'PI', '2024-06-14 16:39:01', '2024-06-14 16:39:01'),
(784, '2205599', 'Lagoa do Sítio', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(785, '2205607', 'Landri Sales', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(786, '2205706', 'Luís Correia', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(787, '2205805', 'Luzilândia', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(788, '2205854', 'Madeiro', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(789, '2205904', 'Manoel Emídio', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(790, '2205953', 'Marcolândia', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(791, '2206001', 'Marcos Parente', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(792, '2206050', 'Massapê do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(793, '2206100', 'Matias Olímpio', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(794, '2206209', 'Miguel Alves', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(795, '2206308', 'Miguel Leão', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(796, '2206357', 'Milton Brandão', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(797, '2206407', 'Monsenhor Gil', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(798, '2206506', 'Monsenhor Hipólito', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(799, '2206605', 'Monte Alegre do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(800, '2206654', 'Morro Cabeça no Tempo', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(801, '2206670', 'Morro do Chapéu do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(802, '2206696', 'Murici dos Portelas', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(803, '2206704', 'Nazaré do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(804, '2206720', 'Nazária', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(805, '2206753', 'Nossa Senhora de Nazaré', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(806, '2206803', 'Nossa Senhora dos Remédios', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(807, '2206902', 'Novo Oriente do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(808, '2206951', 'Novo Santo Antônio', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(809, '2207009', 'Oeiras', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(810, '2207108', 'Olho D\'Água do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(811, '2207207', 'Padre Marcos', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(812, '2207306', 'Paes Landim', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(813, '2207355', 'Pajeú do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(814, '2207405', 'Palmeira do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(815, '2207504', 'Palmeirais', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(816, '2207553', 'Paquetá', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(817, '2207603', 'Parnaguá', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(818, '2207702', 'Parnaíba', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(819, '2207751', 'Passagem Franca do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(820, '2207777', 'Patos do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(821, '2207793', 'Pau D\'Arco do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(822, '2207801', 'Paulistana', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(823, '2207850', 'Pavussu', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(824, '2207900', 'Pedro II', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(825, '2207934', 'Pedro Laurentino', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(826, '2207959', 'Nova Santa Rita', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(827, '2208007', 'Picos', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(828, '2208106', 'Pimenteiras', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(829, '2208205', 'Pio IX', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(830, '2208304', 'Piracuruca', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(831, '2208403', 'Piripiri', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(832, '2208502', 'Porto', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(833, '2208551', 'Porto Alegre do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(834, '2208601', 'Prata do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(835, '2208650', 'Queimada Nova', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(836, '2208700', 'Redenção do Gurguéia', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(837, '2208809', 'Regeneração', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(838, '2208858', 'Riacho Frio', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(839, '2208874', 'Ribeira do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(840, '2208908', 'Ribeiro Gonçalves', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(841, '2209005', 'Rio Grande do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(842, '2209104', 'Santa Cruz do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(843, '2209153', 'Santa Cruz dos Milagres', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(844, '2209203', 'Santa Filomena', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(845, '2209302', 'Santa Luz', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(846, '2209351', 'Santana do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(847, '2209377', 'Santa Rosa do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(848, '2209401', 'Santo Antônio de Lisboa', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(849, '2209450', 'Santo Antônio dos Milagres', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(850, '2209500', 'Santo Inácio do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(851, '2209559', 'São Braz do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(852, '2209609', 'São Félix do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(853, '2209658', 'São Francisco de Assis do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(854, '2209708', 'São Francisco do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(855, '2209757', 'São Gonçalo do Gurguéia', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(856, '2209807', 'São Gonçalo do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(857, '2209856', 'São João da Canabrava', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(858, '2209872', 'São João da Fronteira', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(859, '2209906', 'São João da Serra', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(860, '2209955', 'São João da Varjota', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(861, '2209971', 'São João do Arraial', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(862, '2210003', 'São João do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(863, '2210052', 'São José do Divino', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(864, '2210102', 'São José do Peixe', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(865, '2210201', 'São José do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(866, '2210300', 'São Julião', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(867, '2210359', 'São Lourenço do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(868, '2210375', 'São Luis do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(869, '2210383', 'São Miguel da Baixa Grande', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(870, '2210391', 'São Miguel do Fidalgo', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(871, '2210409', 'São Miguel do Tapuio', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(872, '2210508', 'São Pedro do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(873, '2210607', 'São Raimundo Nonato', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(874, '2210623', 'Sebastião Barros', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(875, '2210631', 'Sebastião Leal', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(876, '2210656', 'Sigefredo Pacheco', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(877, '2210706', 'Simões', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(878, '2210805', 'Simplício Mendes', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(879, '2210904', 'Socorro do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(880, '2210938', 'Sussuapara', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(881, '2210953', 'Tamboril do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(882, '2210979', 'Tanque do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(883, '2211001', 'Teresina', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(884, '2211100', 'União', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(885, '2211209', 'Uruçuí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(886, '2211308', 'Valença do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(887, '2211357', 'Várzea Branca', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(888, '2211407', 'Várzea Grande', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(889, '2211506', 'Vera Mendes', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(890, '2211605', 'Vila Nova do Piauí', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(891, '2211704', 'Wall Ferraz', 'PI', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(892, '2300101', 'Abaiara', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(893, '2300150', 'Acarape', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(894, '2300200', 'Acaraú', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(895, '2300309', 'Acopiara', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(896, '2300408', 'Aiuaba', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(897, '2300507', 'Alcântaras', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(898, '2300606', 'Altaneira', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(899, '2300705', 'Alto Santo', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(900, '2300754', 'Amontada', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(901, '2300804', 'Antonina do Norte', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(902, '2300903', 'Apuiarés', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(903, '2301000', 'Aquiraz', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(904, '2301109', 'Aracati', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(905, '2301208', 'Aracoiaba', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(906, '2301257', 'Ararendá', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(907, '2301307', 'Araripe', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(908, '2301406', 'Aratuba', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(909, '2301505', 'Arneiroz', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(910, '2301604', 'Assaré', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(911, '2301703', 'Aurora', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(912, '2301802', 'Baixio', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(913, '2301851', 'Banabuiú', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(914, '2301901', 'Barbalha', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(915, '2301950', 'Barreira', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(916, '2302008', 'Barro', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(917, '2302057', 'Barroquinha', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(918, '2302107', 'Baturité', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(919, '2302206', 'Beberibe', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(920, '2302305', 'Bela Cruz', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(921, '2302404', 'Boa Viagem', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(922, '2302503', 'Brejo Santo', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(923, '2302602', 'Camocim', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(924, '2302701', 'Campos Sales', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(925, '2302800', 'Canindé', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(926, '2302909', 'Capistrano', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(927, '2303006', 'Caridade', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(928, '2303105', 'Cariré', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(929, '2303204', 'Caririaçu', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(930, '2303303', 'Cariús', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(931, '2303402', 'Carnaubal', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(932, '2303501', 'Cascavel', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(933, '2303600', 'Catarina', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(934, '2303659', 'Catunda', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(935, '2303709', 'Caucaia', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(936, '2303808', 'Cedro', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(937, '2303907', 'Chaval', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(938, '2303931', 'Choró', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(939, '2303956', 'Chorozinho', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(940, '2304004', 'Coreaú', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(941, '2304103', 'Crateús', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(942, '2304202', 'Crato', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(943, '2304236', 'Croatá', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(944, '2304251', 'Cruz', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(945, '2304269', 'Deputado Irapuan Pinheiro', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(946, '2304277', 'Ererê', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(947, '2304285', 'Eusébio', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(948, '2304301', 'Farias Brito', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(949, '2304350', 'Forquilha', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(950, '2304400', 'Fortaleza', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(951, '2304459', 'Fortim', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(952, '2304509', 'Frecheirinha', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(953, '2304608', 'General Sampaio', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(954, '2304657', 'Graça', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(955, '2304707', 'Granja', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(956, '2304806', 'Granjeiro', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(957, '2304905', 'Groaíras', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(958, '2304954', 'Guaiúba', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(959, '2305001', 'Guaraciaba do Norte', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(960, '2305100', 'Guaramiranga', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(961, '2305209', 'Hidrolândia', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(962, '2305233', 'Horizonte', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(963, '2305266', 'Ibaretama', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(964, '2305308', 'Ibiapina', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(965, '2305332', 'Ibicuitinga', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(966, '2305357', 'Icapuí', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(967, '2305407', 'Icó', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(968, '2305506', 'Iguatu', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(969, '2305605', 'Independência', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(970, '2305654', 'Ipaporanga', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(971, '2305704', 'Ipaumirim', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(972, '2305803', 'Ipu', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(973, '2305902', 'Ipueiras', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(974, '2306009', 'Iracema', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(975, '2306108', 'Irauçuba', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(976, '2306207', 'Itaiçaba', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(977, '2306256', 'Itaitinga', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(978, '2306306', 'Itapagé', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(979, '2306405', 'Itapipoca', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(980, '2306504', 'Itapiúna', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(981, '2306553', 'Itarema', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(982, '2306603', 'Itatira', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(983, '2306702', 'Jaguaretama', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(984, '2306801', 'Jaguaribara', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(985, '2306900', 'Jaguaribe', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(986, '2307007', 'Jaguaruana', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(987, '2307106', 'Jardim', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(988, '2307205', 'Jati', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(989, '2307254', 'Jijoca de Jericoacoara', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(990, '2307304', 'Juazeiro do Norte', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(991, '2307403', 'Jucás', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(992, '2307502', 'Lavras da Mangabeira', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(993, '2307601', 'Limoeiro do Norte', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(994, '2307635', 'Madalena', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(995, '2307650', 'Maracanaú', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(996, '2307700', 'Maranguape', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(997, '2307809', 'Marco', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(998, '2307908', 'Martinópole', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(999, '2308005', 'Massapê', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1000, '2308104', 'Mauriti', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1001, '2308203', 'Meruoca', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1002, '2308302', 'Milagres', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1003, '2308351', 'Milhã', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1004, '2308377', 'Miraíma', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1005, '2308401', 'Missão Velha', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1006, '2308500', 'Mombaça', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1007, '2308609', 'Monsenhor Tabosa', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1008, '2308708', 'Morada Nova', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1009, '2308807', 'Moraújo', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1010, '2308906', 'Morrinhos', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1011, '2309003', 'Mucambo', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1012, '2309102', 'Mulungu', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1013, '2309201', 'Nova Olinda', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1014, '2309300', 'Nova Russas', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1015, '2309409', 'Novo Oriente', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1016, '2309458', 'Ocara', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1017, '2309508', 'Orós', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1018, '2309607', 'Pacajus', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1019, '2309706', 'Pacatuba', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1020, '2309805', 'Pacoti', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1021, '2309904', 'Pacujá', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1022, '2310001', 'Palhano', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1023, '2310100', 'Palmácia', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1024, '2310209', 'Paracuru', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1025, '2310258', 'Paraipaba', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1026, '2310308', 'Parambu', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1027, '2310407', 'Paramoti', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1028, '2310506', 'Pedra Branca', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1029, '2310605', 'Penaforte', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1030, '2310704', 'Pentecoste', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1031, '2310803', 'Pereiro', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1032, '2310852', 'Pindoretama', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1033, '2310902', 'Piquet Carneiro', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1034, '2310951', 'Pires Ferreira', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1035, '2311009', 'Poranga', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1036, '2311108', 'Porteiras', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1037, '2311207', 'Potengi', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1038, '2311231', 'Potiretama', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1039, '2311264', 'Quiterianópolis', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1040, '2311306', 'Quixadá', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1041, '2311355', 'Quixelô', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1042, '2311405', 'Quixeramobim', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1043, '2311504', 'Quixeré', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1044, '2311603', 'Redenção', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1045, '2311702', 'Reriutaba', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1046, '2311801', 'Russas', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1047, '2311900', 'Saboeiro', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1048, '2311959', 'Salitre', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1049, '2312007', 'Santana do Acaraú', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1050, '2312106', 'Santana do Cariri', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1051, '2312205', 'Santa Quitéria', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1052, '2312304', 'São Benedito', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1053, '2312403', 'São Gonçalo do Amarante', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1054, '2312502', 'São João do Jaguaribe', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1055, '2312601', 'São Luís do Curu', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1056, '2312700', 'Senador Pompeu', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1057, '2312809', 'Senador Sá', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1058, '2312908', 'Sobral', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1059, '2313005', 'Solonópole', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1060, '2313104', 'Tabuleiro do Norte', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1061, '2313203', 'Tamboril', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1062, '2313252', 'Tarrafas', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1063, '2313302', 'Tauá', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1064, '2313351', 'Tejuçuoca', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1065, '2313401', 'Tianguá', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1066, '2313500', 'Trairi', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1067, '2313559', 'Tururu', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1068, '2313609', 'Ubajara', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1069, '2313708', 'Umari', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1070, '2313757', 'Umirim', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1071, '2313807', 'Uruburetama', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1072, '2313906', 'Uruoca', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1073, '2313955', 'Varjota', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1074, '2314003', 'Várzea Alegre', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1075, '2314102', 'Viçosa do Ceará', 'CE', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1076, '2400109', 'Acari', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1077, '2400208', 'Açu', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1078, '2400307', 'Afonso Bezerra', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1079, '2400406', 'Água Nova', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1080, '2400505', 'Alexandria', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1081, '2400604', 'Almino Afonso', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1082, '2400703', 'Alto do Rodrigues', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1083, '2400802', 'Angicos', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1084, '2400901', 'Antônio Martins', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1085, '2401008', 'Apodi', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1086, '2401107', 'Areia Branca', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1087, '2401206', 'Arês', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1088, '2401305', 'Augusto Severo', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1089, '2401404', 'Baía Formosa', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1090, '2401453', 'Baraúna', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1091, '2401503', 'Barcelona', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1092, '2401602', 'Bento Fernandes', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1093, '2401651', 'Bodó', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1094, '2401701', 'Bom Jesus', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1095, '2401800', 'Brejinho', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1096, '2401859', 'Caiçara do Norte', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1097, '2401909', 'Caiçara do Rio do Vento', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1098, '2402006', 'Caicó', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1099, '2402105', 'Campo Redondo', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1100, '2402204', 'Canguaretama', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1101, '2402303', 'Caraúbas', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1102, '2402402', 'Carnaúba dos Dantas', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1103, '2402501', 'Carnaubais', 'RN', '2024-06-14 16:39:02', '2024-06-14 16:39:02'),
(1104, '2402600', 'Ceará-Mirim', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1105, '2402709', 'Cerro Corá', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1106, '2402808', 'Coronel Ezequiel', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1107, '2402907', 'Coronel João Pessoa', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1108, '2403004', 'Cruzeta', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1109, '2403103', 'Currais Novos', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1110, '2403202', 'Doutor Severiano', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1111, '2403251', 'Parnamirim', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1112, '2403301', 'Encanto', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1113, '2403400', 'Equador', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1114, '2403509', 'Espírito Santo', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1115, '2403608', 'Extremoz', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1116, '2403707', 'Felipe Guerra', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1117, '2403756', 'Fernando Pedroza', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1118, '2403806', 'Florânia', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1119, '2403905', 'Francisco Dantas', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1120, '2404002', 'Frutuoso Gomes', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1121, '2404101', 'Galinhos', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1122, '2404200', 'Goianinha', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1123, '2404309', 'Governador Dix-Sept Rosado', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1124, '2404408', 'Grossos', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1125, '2404507', 'Guamaré', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1126, '2404606', 'Ielmo Marinho', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1127, '2404705', 'Ipanguaçu', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1128, '2404804', 'Ipueira', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1129, '2404853', 'Itajá', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1130, '2404903', 'Itaú', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1131, '2405009', 'Jaçanã', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1132, '2405108', 'Jandaíra', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1133, '2405207', 'Janduís', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1134, '2405306', 'Januário Cicco', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1135, '2405405', 'Japi', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1136, '2405504', 'Jardim de Angicos', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1137, '2405603', 'Jardim de Piranhas', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1138, '2405702', 'Jardim do Seridó', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1139, '2405801', 'João Câmara', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1140, '2405900', 'João Dias', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1141, '2406007', 'José da Penha', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1142, '2406106', 'Jucurutu', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1143, '2406155', 'Jundiá', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1144, '2406205', 'Lagoa D\'Anta', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1145, '2406304', 'Lagoa de Pedras', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1146, '2406403', 'Lagoa de Velhos', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1147, '2406502', 'Lagoa Nova', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1148, '2406601', 'Lagoa Salgada', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1149, '2406700', 'Lajes', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1150, '2406809', 'Lajes Pintadas', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1151, '2406908', 'Lucrécia', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1152, '2407005', 'Luís Gomes', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1153, '2407104', 'Macaíba', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1154, '2407203', 'Macau', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1155, '2407252', 'Major Sales', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1156, '2407302', 'Marcelino Vieira', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1157, '2407401', 'Martins', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1158, '2407500', 'Maxaranguape', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1159, '2407609', 'Messias Targino', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1160, '2407708', 'Montanhas', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1161, '2407807', 'Monte Alegre', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1162, '2407906', 'Monte das Gameleiras', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1163, '2408003', 'Mossoró', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1164, '2408102', 'Natal', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1165, '2408201', 'Nísia Floresta', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1166, '2408300', 'Nova Cruz', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1167, '2408409', 'Olho-D\'Água do Borges', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1168, '2408508', 'Ouro Branco', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1169, '2408607', 'Paraná', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1170, '2408706', 'Paraú', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1171, '2408805', 'Parazinho', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1172, '2408904', 'Parelhas', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1173, '2408953', 'Rio do Fogo', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1174, '2409100', 'Passa e Fica', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1175, '2409209', 'Passagem', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1176, '2409308', 'Patu', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1177, '2409332', 'Santa Maria', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1178, '2409407', 'Pau dos Ferros', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1179, '2409506', 'Pedra Grande', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1180, '2409605', 'Pedra Preta', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1181, '2409704', 'Pedro Avelino', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1182, '2409803', 'Pedro Velho', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(1183, '2409902', 'Pendências', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1184, '2410009', 'Pilões', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1185, '2410108', 'Poço Branco', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1186, '2410207', 'Portalegre', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1187, '2410256', 'Porto do Mangue', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1188, '2410306', 'Presidente Juscelino', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1189, '2410405', 'Pureza', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1190, '2410504', 'Rafael Fernandes', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1191, '2410603', 'Rafael Godeiro', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1192, '2410702', 'Riacho da Cruz', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1193, '2410801', 'Riacho de Santana', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1194, '2410900', 'Riachuelo', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1195, '2411007', 'Rodolfo Fernandes', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1196, '2411056', 'Tibau', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1197, '2411106', 'Ruy Barbosa', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1198, '2411205', 'Santa Cruz', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1199, '2411403', 'Santana do Matos', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1200, '2411429', 'Santana do Seridó', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1201, '2411502', 'Santo Antônio', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1202, '2411601', 'São Bento do Norte', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1203, '2411700', 'São Bento do Trairí', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1204, '2411809', 'São Fernando', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1205, '2411908', 'São Francisco do Oeste', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1206, '2412005', 'São Gonçalo do Amarante', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1207, '2412104', 'São João do Sabugi', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1208, '2412203', 'São José de Mipibu', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1209, '2412302', 'São José do Campestre', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1210, '2412401', 'São José do Seridó', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1211, '2412500', 'São Miguel', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1212, '2412559', 'São Miguel do Gostoso', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1213, '2412609', 'São Paulo do Potengi', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1214, '2412708', 'São Pedro', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1215, '2412807', 'São Rafael', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1216, '2412906', 'São Tomé', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1217, '2413003', 'São Vicente', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1218, '2413102', 'Senador Elói de Souza', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1219, '2413201', 'Senador Georgino Avelino', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1220, '2413300', 'Serra de São Bento', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1221, '2413359', 'Serra do Mel', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1222, '2413409', 'Serra Negra do Norte', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1223, '2413508', 'Serrinha', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1224, '2413557', 'Serrinha dos Pintos', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1225, '2413607', 'Severiano Melo', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1226, '2413706', 'Sítio Novo', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1227, '2413805', 'Taboleiro Grande', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1228, '2413904', 'Taipu', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1229, '2414001', 'Tangará', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1230, '2414100', 'Tenente Ananias', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1231, '2414159', 'Tenente Laurentino Cruz', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1232, '2414209', 'Tibau do Sul', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1233, '2414308', 'Timbaúba dos Batistas', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1234, '2414407', 'Touros', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1235, '2414456', 'Triunfo Potiguar', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1236, '2414506', 'Umarizal', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1237, '2414605', 'Upanema', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1238, '2414704', 'Várzea', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1239, '2414753', 'Venha-Ver', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1240, '2414803', 'Vera Cruz', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1241, '2414902', 'Viçosa', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1242, '2415008', 'Vila Flor', 'RN', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1243, '2500106', 'Água Branca', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1244, '2500205', 'Aguiar', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1245, '2500304', 'Alagoa Grande', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1246, '2500403', 'Alagoa Nova', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1247, '2500502', 'Alagoinha', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1248, '2500536', 'Alcantil', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1249, '2500577', 'Algodão de Jandaíra', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1250, '2500601', 'Alhandra', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1251, '2500700', 'São João do Rio do Peixe', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1252, '2500734', 'Amparo', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1253, '2500775', 'Aparecida', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1254, '2500809', 'Araçagi', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1255, '2500908', 'Arara', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1256, '2501005', 'Araruna', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1257, '2501104', 'Areia', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1258, '2501153', 'Areia de Baraúnas', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1259, '2501203', 'Areial', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1260, '2501302', 'Aroeiras', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1261, '2501351', 'Assunção', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1262, '2501401', 'Baía da Traição', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1263, '2501500', 'Bananeiras', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1264, '2501534', 'Baraúna', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1265, '2501575', 'Barra de Santana', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1266, '2501609', 'Barra de Santa Rosa', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1267, '2501708', 'Barra de São Miguel', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1268, '2501807', 'Bayeux', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1269, '2501906', 'Belém', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1270, '2502003', 'Belém do Brejo do Cruz', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1271, '2502052', 'Bernardino Batista', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1272, '2502102', 'Boa Ventura', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1273, '2502151', 'Boa Vista', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1274, '2502201', 'Bom Jesus', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1275, '2502300', 'Bom Sucesso', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1276, '2502409', 'Bonito de Santa Fé', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1277, '2502508', 'Boqueirão', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1278, '2502607', 'Igaracy', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1279, '2502706', 'Borborema', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1280, '2502805', 'Brejo do Cruz', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1281, '2502904', 'Brejo dos Santos', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1282, '2503001', 'Caaporã', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1283, '2503100', 'Cabaceiras', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1284, '2503209', 'Cabedelo', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1285, '2503308', 'Cachoeira dos Índios', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1286, '2503407', 'Cacimba de Areia', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1287, '2503506', 'Cacimba de Dentro', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1288, '2503555', 'Cacimbas', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1289, '2503605', 'Caiçara', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1290, '2503704', 'Cajazeiras', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1291, '2503753', 'Cajazeirinhas', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1292, '2503803', 'Caldas Brandão', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1293, '2503902', 'Camalaú', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1294, '2504009', 'Campina Grande', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1295, '2504033', 'Capim', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1296, '2504074', 'Caraúbas', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1297, '2504108', 'Carrapateira', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1298, '2504157', 'Casserengue', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1299, '2504207', 'Catingueira', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1300, '2504306', 'Catolé do Rocha', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1301, '2504355', 'Caturité', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1302, '2504405', 'Conceição', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1303, '2504504', 'Condado', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1304, '2504603', 'Conde', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1305, '2504702', 'Congo', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1306, '2504801', 'Coremas', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1307, '2504850', 'Coxixola', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1308, '2504900', 'Cruz do Espírito Santo', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1309, '2505006', 'Cubati', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1310, '2505105', 'Cuité', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1311, '2505204', 'Cuitegi', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1312, '2505238', 'Cuité de Mamanguape', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1313, '2505279', 'Curral de Cima', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1314, '2505303', 'Curral Velho', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1315, '2505352', 'Damião', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1316, '2505402', 'Desterro', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1317, '2505501', 'Vista Serrana', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1318, '2505600', 'Diamante', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1319, '2505709', 'Dona Inês', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1320, '2505808', 'Duas Estradas', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1321, '2505907', 'Emas', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1322, '2506004', 'Esperança', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1323, '2506103', 'Fagundes', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1324, '2506202', 'Frei Martinho', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1325, '2506251', 'Gado Bravo', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1326, '2506301', 'Guarabira', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1327, '2506400', 'Gurinhém', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1328, '2506509', 'Gurjão', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1329, '2506608', 'Ibiara', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1330, '2506707', 'Imaculada', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1331, '2506806', 'Ingá', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1332, '2506905', 'Itabaiana', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1333, '2507002', 'Itaporanga', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1334, '2507101', 'Itapororoca', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1335, '2507200', 'Itatuba', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1336, '2507309', 'Jacaraú', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1337, '2507408', 'Jericó', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1338, '2507507', 'João Pessoa', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1339, '2507606', 'Juarez Távora', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1340, '2507705', 'Juazeirinho', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1341, '2507804', 'Junco do Seridó', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1342, '2507903', 'Juripiranga', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1343, '2508000', 'Juru', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1344, '2508109', 'Lagoa', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1345, '2508208', 'Lagoa de Dentro', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1346, '2508307', 'Lagoa Seca', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1347, '2508406', 'Lastro', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1348, '2508505', 'Livramento', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1349, '2508554', 'Logradouro', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1350, '2508604', 'Lucena', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1351, '2508703', 'Mãe D\'Água', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1352, '2508802', 'Malta', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1353, '2508901', 'Mamanguape', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1354, '2509008', 'Manaíra', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1355, '2509057', 'Marcação', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1356, '2509107', 'Mari', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1357, '2509156', 'Marizópolis', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1358, '2509206', 'Massaranduba', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1359, '2509305', 'Mataraca', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1360, '2509339', 'Matinhas', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1361, '2509370', 'Mato Grosso', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1362, '2509396', 'Maturéia', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1363, '2509404', 'Mogeiro', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1364, '2509503', 'Montadas', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1365, '2509602', 'Monte Horebe', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1366, '2509701', 'Monteiro', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1367, '2509800', 'Mulungu', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1368, '2509909', 'Natuba', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1369, '2510006', 'Nazarezinho', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1370, '2510105', 'Nova Floresta', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1371, '2510204', 'Nova Olinda', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1372, '2510303', 'Nova Palmeira', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1373, '2510402', 'Olho D\'Água', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1374, '2510501', 'Olivedos', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1375, '2510600', 'Ouro Velho', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1376, '2510659', 'Parari', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1377, '2510709', 'Passagem', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1378, '2510808', 'Patos', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1379, '2510907', 'Paulista', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1380, '2511004', 'Pedra Branca', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1381, '2511103', 'Pedra Lavrada', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1382, '2511202', 'Pedras de Fogo', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1383, '2511301', 'Piancó', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1384, '2511400', 'Picuí', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1385, '2511509', 'Pilar', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1386, '2511608', 'Pilões', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1387, '2511707', 'Pilõezinhos', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1388, '2511806', 'Pirpirituba', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1389, '2511905', 'Pitimbu', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1390, '2512002', 'Pocinhos', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1391, '2512036', 'Poço Dantas', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1392, '2512077', 'Poço de José de Moura', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1393, '2512101', 'Pombal', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1394, '2512200', 'Prata', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1395, '2512309', 'Princesa Isabel', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1396, '2512408', 'Puxinanã', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1397, '2512507', 'Queimadas', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1398, '2512606', 'Quixabá', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1399, '2512705', 'Remígio', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1400, '2512721', 'Pedro Régis', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1401, '2512747', 'Riachão', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1402, '2512754', 'Riachão do Bacamarte', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1403, '2512762', 'Riachão do Poço', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1404, '2512788', 'Riacho de Santo Antônio', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1405, '2512804', 'Riacho dos Cavalos', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1406, '2512903', 'Rio Tinto', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1407, '2513000', 'Salgadinho', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1408, '2513109', 'Salgado de São Félix', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1409, '2513158', 'Santa Cecília', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1410, '2513208', 'Santa Cruz', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1411, '2513307', 'Santa Helena', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1412, '2513356', 'Santa Inês', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1413, '2513406', 'Santa Luzia', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1414, '2513505', 'Santana de Mangueira', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1415, '2513604', 'Santana dos Garrotes', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1416, '2513653', 'Joca Claudino', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1417, '2513703', 'Santa Rita', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1418, '2513802', 'Santa Teresinha', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1419, '2513851', 'Santo André', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1420, '2513901', 'São Bento', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1421, '2513927', 'São Bentinho', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1422, '2513943', 'São Domingos do Cariri', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1423, '2513968', 'São Domingos', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1424, '2513984', 'São Francisco', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1425, '2514008', 'São João do Cariri', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1426, '2514107', 'São João do Tigre', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1427, '2514206', 'São José da Lagoa Tapada', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1428, '2514305', 'São José de Caiana', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1429, '2514404', 'São José de Espinharas', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1430, '2514453', 'São José dos Ramos', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1431, '2514503', 'São José de Piranhas', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1432, '2514552', 'São José de Princesa', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1433, '2514602', 'São José do Bonfim', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1434, '2514651', 'São José do Brejo do Cruz', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1435, '2514701', 'São José do Sabugi', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1436, '2514800', 'São José dos Cordeiros', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1437, '2514909', 'São Mamede', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1438, '2515005', 'São Miguel de Taipu', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1439, '2515104', 'São Sebastião de Lagoa de Roça', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1440, '2515203', 'São Sebastião do Umbuzeiro', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1441, '2515302', 'Sapé', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1442, '2515401', 'São Vicente do Seridó', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1443, '2515500', 'Serra Branca', 'PB', '2024-06-14 16:39:03', '2024-06-14 16:39:03'),
(1444, '2515609', 'Serra da Raiz', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1445, '2515708', 'Serra Grande', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1446, '2515807', 'Serra Redonda', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1447, '2515906', 'Serraria', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1448, '2515930', 'Sertãozinho', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1449, '2515971', 'Sobrado', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1450, '2516003', 'Solânea', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1451, '2516102', 'Soledade', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1452, '2516151', 'Sossêgo', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1453, '2516201', 'Sousa', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1454, '2516300', 'Sumé', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1455, '2516409', 'Tacima', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1456, '2516508', 'Taperoá', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1457, '2516607', 'Tavares', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1458, '2516706', 'Teixeira', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1459, '2516755', 'Tenório', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1460, '2516805', 'Triunfo', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1461, '2516904', 'Uiraúna', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1462, '2517001', 'Umbuzeiro', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1463, '2517100', 'Várzea', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1464, '2517209', 'Vieirópolis', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1465, '2517407', 'Zabelê', 'PB', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1466, '2600054', 'Abreu e Lima', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1467, '2600104', 'Afogados da Ingazeira', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1468, '2600203', 'Afrânio', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1469, '2600302', 'Agrestina', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1470, '2600401', 'Água Preta', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1471, '2600500', 'Águas Belas', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1472, '2600609', 'Alagoinha', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1473, '2600708', 'Aliança', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1474, '2600807', 'Altinho', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1475, '2600906', 'Amaraji', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1476, '2601003', 'Angelim', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1477, '2601052', 'Araçoiaba', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1478, '2601102', 'Araripina', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1479, '2601201', 'Arcoverde', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1480, '2601300', 'Barra de Guabiraba', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1481, '2601409', 'Barreiros', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1482, '2601508', 'Belém de Maria', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1483, '2601607', 'Belém do São Francisco', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1484, '2601706', 'Belo Jardim', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1485, '2601805', 'Betânia', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1486, '2601904', 'Bezerros', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1487, '2602001', 'Bodocó', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1488, '2602100', 'Bom Conselho', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1489, '2602209', 'Bom Jardim', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1490, '2602308', 'Bonito', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1491, '2602407', 'Brejão', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1492, '2602506', 'Brejinho', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1493, '2602605', 'Brejo da Madre de Deus', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1494, '2602704', 'Buenos Aires', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1495, '2602803', 'Buíque', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1496, '2602902', 'Cabo de Santo Agostinho', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1497, '2603009', 'Cabrobó', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1498, '2603108', 'Cachoeirinha', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1499, '2603207', 'Caetés', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1500, '2603306', 'Calçado', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1501, '2603405', 'Calumbi', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1502, '2603454', 'Camaragibe', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1503, '2603504', 'Camocim de São Félix', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1504, '2603603', 'Camutanga', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1505, '2603702', 'Canhotinho', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1506, '2603801', 'Capoeiras', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1507, '2603900', 'Carnaíba', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1508, '2603926', 'Carnaubeira da Penha', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1509, '2604007', 'Carpina', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1510, '2604106', 'Caruaru', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1511, '2604155', 'Casinhas', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1512, '2604205', 'Catende', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1513, '2604304', 'Cedro', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1514, '2604403', 'Chã de Alegria', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1515, '2604502', 'Chã Grande', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1516, '2604601', 'Condado', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1517, '2604700', 'Correntes', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1518, '2604809', 'Cortês', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1519, '2604908', 'Cumaru', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1520, '2605004', 'Cupira', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1521, '2605103', 'Custódia', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1522, '2605152', 'Dormentes', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1523, '2605202', 'Escada', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1524, '2605301', 'Exu', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1525, '2605400', 'Feira Nova', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1526, '2605459', 'Fernando de Noronha', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1527, '2605509', 'Ferreiros', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1528, '2605608', 'Flores', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1529, '2605707', 'Floresta', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1530, '2605806', 'Frei Miguelinho', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1531, '2605905', 'Gameleira', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1532, '2606002', 'Garanhuns', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1533, '2606101', 'Glória do Goitá', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1534, '2606200', 'Goiana', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1535, '2606309', 'Granito', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1536, '2606408', 'Gravatá', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1537, '2606507', 'Iati', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1538, '2606606', 'Ibimirim', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1539, '2606705', 'Ibirajuba', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1540, '2606804', 'Igarassu', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1541, '2606903', 'Iguaraci', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1542, '2607000', 'Inajá', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1543, '2607109', 'Ingazeira', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1544, '2607208', 'Ipojuca', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1545, '2607307', 'Ipubi', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1546, '2607406', 'Itacuruba', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1547, '2607505', 'Itaíba', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1548, '2607604', 'Ilha de Itamaracá', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1549, '2607653', 'Itambé', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1550, '2607703', 'Itapetim', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1551, '2607752', 'Itapissuma', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1552, '2607802', 'Itaquitinga', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1553, '2607901', 'Jaboatão dos Guararapes', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1554, '2607950', 'Jaqueira', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1555, '2608008', 'Jataúba', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1556, '2608057', 'Jatobá', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1557, '2608107', 'João Alfredo', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1558, '2608206', 'Joaquim Nabuco', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1559, '2608255', 'Jucati', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1560, '2608305', 'Jupi', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1561, '2608404', 'Jurema', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1562, '2608453', 'Lagoa do Carro', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1563, '2608503', 'Lagoa de Itaenga', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1564, '2608602', 'Lagoa do Ouro', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1565, '2608701', 'Lagoa dos Gatos', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1566, '2608750', 'Lagoa Grande', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1567, '2608800', 'Lajedo', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1568, '2608909', 'Limoeiro', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1569, '2609006', 'Macaparana', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1570, '2609105', 'Machados', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1571, '2609154', 'Manari', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1572, '2609204', 'Maraial', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1573, '2609303', 'Mirandiba', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1574, '2609402', 'Moreno', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1575, '2609501', 'Nazaré da Mata', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1576, '2609600', 'Olinda', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1577, '2609709', 'Orobó', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1578, '2609808', 'Orocó', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1579, '2609907', 'Ouricuri', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1580, '2610004', 'Palmares', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1581, '2610103', 'Palmeirina', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1582, '2610202', 'Panelas', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1583, '2610301', 'Paranatama', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1584, '2610400', 'Parnamirim', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1585, '2610509', 'Passira', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1586, '2610608', 'Paudalho', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1587, '2610707', 'Paulista', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1588, '2610806', 'Pedra', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1589, '2610905', 'Pesqueira', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1590, '2611002', 'Petrolândia', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1591, '2611101', 'Petrolina', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1592, '2611200', 'Poção', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1593, '2611309', 'Pombos', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1594, '2611408', 'Primavera', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1595, '2611507', 'Quipapá', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1596, '2611533', 'Quixaba', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1597, '2611606', 'Recife', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1598, '2611705', 'Riacho das Almas', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1599, '2611804', 'Ribeirão', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1600, '2611903', 'Rio Formoso', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1601, '2612000', 'Sairé', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1602, '2612109', 'Salgadinho', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1603, '2612208', 'Salgueiro', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1604, '2612307', 'Saloá', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1605, '2612406', 'Sanharó', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1606, '2612455', 'Santa Cruz', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1607, '2612471', 'Santa Cruz da Baixa Verde', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1608, '2612505', 'Santa Cruz do Capibaribe', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1609, '2612554', 'Santa Filomena', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1610, '2612604', 'Santa Maria da Boa Vista', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1611, '2612703', 'Santa Maria do Cambucá', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1612, '2612802', 'Santa Terezinha', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1613, '2612901', 'São Benedito do Sul', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1614, '2613008', 'São Bento do Una', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1615, '2613107', 'São Caitano', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1616, '2613206', 'São João', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1617, '2613305', 'São Joaquim do Monte', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1618, '2613404', 'São José da Coroa Grande', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1619, '2613503', 'São José do Belmonte', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1620, '2613602', 'São José do Egito', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1621, '2613701', 'São Lourenço da Mata', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1622, '2613800', 'São Vicente Ferrer', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1623, '2613909', 'Serra Talhada', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1624, '2614006', 'Serrita', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1625, '2614105', 'Sertânia', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1626, '2614204', 'Sirinhaém', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1627, '2614303', 'Moreilândia', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1628, '2614402', 'Solidão', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1629, '2614501', 'Surubim', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1630, '2614600', 'Tabira', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1631, '2614709', 'Tacaimbó', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1632, '2614808', 'Tacaratu', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1633, '2614857', 'Tamandaré', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1634, '2615003', 'Taquaritinga do Norte', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1635, '2615102', 'Terezinha', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1636, '2615201', 'Terra Nova', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1637, '2615300', 'Timbaúba', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1638, '2615409', 'Toritama', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1639, '2615508', 'Tracunhaém', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1640, '2615607', 'Trindade', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1641, '2615706', 'Triunfo', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1642, '2615805', 'Tupanatinga', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1643, '2615904', 'Tuparetama', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1644, '2616001', 'Venturosa', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1645, '2616100', 'Verdejante', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1646, '2616183', 'Vertente do Lério', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1647, '2616209', 'Vertentes', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1648, '2616308', 'Vicência', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1649, '2616407', 'Vitória de Santo Antão', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1650, '2616506', 'Xexéu', 'PE', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1651, '2700102', 'Água Branca', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1652, '2700201', 'Anadia', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1653, '2700300', 'Arapiraca', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1654, '2700409', 'Atalaia', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1655, '2700508', 'Barra de Santo Antônio', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1656, '2700607', 'Barra de São Miguel', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1657, '2700706', 'Batalha', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1658, '2700805', 'Belém', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1659, '2700904', 'Belo Monte', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1660, '2701001', 'Boca da Mata', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1661, '2701100', 'Branquinha', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1662, '2701209', 'Cacimbinhas', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1663, '2701308', 'Cajueiro', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1664, '2701357', 'Campestre', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1665, '2701407', 'Campo Alegre', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1666, '2701506', 'Campo Grande', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1667, '2701605', 'Canapi', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1668, '2701704', 'Capela', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1669, '2701803', 'Carneiros', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1670, '2701902', 'Chã Preta', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1671, '2702009', 'Coité do Nóia', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1672, '2702108', 'Colônia Leopoldina', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1673, '2702207', 'Coqueiro Seco', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1674, '2702306', 'Coruripe', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1675, '2702355', 'Craíbas', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1676, '2702405', 'Delmiro Gouveia', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1677, '2702504', 'Dois Riachos', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1678, '2702553', 'Estrela de Alagoas', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1679, '2702603', 'Feira Grande', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1680, '2702702', 'Feliz Deserto', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1681, '2702801', 'Flexeiras', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1682, '2702900', 'Girau do Ponciano', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1683, '2703007', 'Ibateguara', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1684, '2703106', 'Igaci', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1685, '2703205', 'Igreja Nova', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1686, '2703304', 'Inhapi', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1687, '2703403', 'Jacaré dos Homens', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1688, '2703502', 'Jacuípe', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1689, '2703601', 'Japaratinga', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1690, '2703700', 'Jaramataia', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1691, '2703759', 'Jequiá da Praia', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1692, '2703809', 'Joaquim Gomes', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1693, '2703908', 'Jundiá', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1694, '2704005', 'Junqueiro', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1695, '2704104', 'Lagoa da Canoa', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1696, '2704203', 'Limoeiro de Anadia', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1697, '2704302', 'Maceió', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1698, '2704401', 'Major Isidoro', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1699, '2704500', 'Maragogi', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1700, '2704609', 'Maravilha', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1701, '2704708', 'Marechal Deodoro', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1702, '2704807', 'Maribondo', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1703, '2704906', 'Mar Vermelho', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1704, '2705002', 'Mata Grande', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1705, '2705101', 'Matriz de Camaragibe', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1706, '2705200', 'Messias', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1707, '2705309', 'Minador do Negrão', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1708, '2705408', 'Monteirópolis', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1709, '2705507', 'Murici', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1710, '2705606', 'Novo Lino', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1711, '2705705', 'Olho D\'Água das Flores', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1712, '2705804', 'Olho D\'Água do Casado', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1713, '2705903', 'Olho D\'Água Grande', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1714, '2706000', 'Olivença', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1715, '2706109', 'Ouro Branco', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1716, '2706208', 'Palestina', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1717, '2706307', 'Palmeira dos Índios', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1718, '2706406', 'Pão de Açúcar', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1719, '2706422', 'Pariconha', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1720, '2706448', 'Paripueira', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1721, '2706505', 'Passo de Camaragibe', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1722, '2706604', 'Paulo Jacinto', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1723, '2706703', 'Penedo', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1724, '2706802', 'Piaçabuçu', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1725, '2706901', 'Pilar', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1726, '2707008', 'Pindoba', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1727, '2707107', 'Piranhas', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1728, '2707206', 'Poço das Trincheiras', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1729, '2707305', 'Porto Calvo', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1730, '2707404', 'Porto de Pedras', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1731, '2707503', 'Porto Real do Colégio', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1732, '2707602', 'Quebrangulo', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1733, '2707701', 'Rio Largo', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1734, '2707800', 'Roteiro', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1735, '2707909', 'Santa Luzia do Norte', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1736, '2708006', 'Santana do Ipanema', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1737, '2708105', 'Santana do Mundaú', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1738, '2708204', 'São Brás', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1739, '2708303', 'São José da Laje', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1740, '2708402', 'São José da Tapera', 'AL', '2024-06-14 16:39:04', '2024-06-14 16:39:04'),
(1741, '2708501', 'São Luís do Quitunde', 'AL', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1742, '2708600', 'São Miguel dos Campos', 'AL', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1743, '2708709', 'São Miguel dos Milagres', 'AL', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1744, '2708808', 'São Sebastião', 'AL', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1745, '2708907', 'Satuba', 'AL', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1746, '2708956', 'Senador Rui Palmeira', 'AL', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1747, '2709004', 'Tanque D\'Arca', 'AL', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1748, '2709103', 'Taquarana', 'AL', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1749, '2709152', 'Teotônio Vilela', 'AL', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1750, '2709202', 'Traipu', 'AL', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1751, '2709301', 'União dos Palmares', 'AL', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1752, '2709400', 'Viçosa', 'AL', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1753, '2800100', 'Amparo de São Francisco', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1754, '2800209', 'Aquidabã', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1755, '2800308', 'Aracaju', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1756, '2800407', 'Arauá', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1757, '2800506', 'Areia Branca', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1758, '2800605', 'Barra dos Coqueiros', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1759, '2800670', 'Boquim', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1760, '2800704', 'Brejo Grande', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1761, '2801009', 'Campo do Brito', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1762, '2801108', 'Canhoba', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1763, '2801207', 'Canindé de São Francisco', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1764, '2801306', 'Capela', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1765, '2801405', 'Carira', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1766, '2801504', 'Carmópolis', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1767, '2801603', 'Cedro de São João', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1768, '2801702', 'Cristinápolis', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1769, '2801900', 'Cumbe', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1770, '2802007', 'Divina Pastora', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1771, '2802106', 'Estância', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1772, '2802205', 'Feira Nova', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1773, '2802304', 'Frei Paulo', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1774, '2802403', 'Gararu', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1775, '2802502', 'General Maynard', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(1776, '2802601', 'Gracho Cardoso', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1777, '2802700', 'Ilha das Flores', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1778, '2802809', 'Indiaroba', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1779, '2802908', 'Itabaiana', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1780, '2803005', 'Itabaianinha', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1781, '2803104', 'Itabi', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1782, '2803203', 'Itaporanga D\'Ajuda', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1783, '2803302', 'Japaratuba', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1784, '2803401', 'Japoatã', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1785, '2803500', 'Lagarto', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1786, '2803609', 'Laranjeiras', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1787, '2803708', 'Macambira', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1788, '2803807', 'Malhada dos Bois', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1789, '2803906', 'Malhador', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1790, '2804003', 'Maruim', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1791, '2804102', 'Moita Bonita', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1792, '2804201', 'Monte Alegre de Sergipe', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1793, '2804300', 'Muribeca', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1794, '2804409', 'Neópolis', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1795, '2804458', 'Nossa Senhora Aparecida', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1796, '2804508', 'Nossa Senhora da Glória', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1797, '2804607', 'Nossa Senhora das Dores', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1798, '2804706', 'Nossa Senhora de Lourdes', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1799, '2804805', 'Nossa Senhora do Socorro', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1800, '2804904', 'Pacatuba', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1801, '2805000', 'Pedra Mole', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1802, '2805109', 'Pedrinhas', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1803, '2805208', 'Pinhão', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1804, '2805307', 'Pirambu', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1805, '2805406', 'Poço Redondo', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1806, '2805505', 'Poço Verde', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1807, '2805604', 'Porto da Folha', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1808, '2805703', 'Propriá', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1809, '2805802', 'Riachão do Dantas', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1810, '2805901', 'Riachuelo', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1811, '2806008', 'Ribeirópolis', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1812, '2806107', 'Rosário do Catete', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1813, '2806206', 'Salgado', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1814, '2806305', 'Santa Luzia do Itanhy', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1815, '2806404', 'Santana do São Francisco', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1816, '2806503', 'Santa Rosa de Lima', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1817, '2806602', 'Santo Amaro das Brotas', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1818, '2806701', 'São Cristóvão', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1819, '2806800', 'São Domingos', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1820, '2806909', 'São Francisco', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1821, '2807006', 'São Miguel do Aleixo', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1822, '2807105', 'Simão Dias', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1823, '2807204', 'Siriri', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1824, '2807303', 'Telha', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1825, '2807402', 'Tobias Barreto', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1826, '2807501', 'Tomar do Geru', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1827, '2807600', 'Umbaúba', 'SE', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1828, '2900108', 'Abaíra', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1829, '2900207', 'Abaré', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1830, '2900306', 'Acajutiba', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1831, '2900355', 'Adustina', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1832, '2900405', 'Água Fria', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1833, '2900504', 'Érico Cardoso', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1834, '2900603', 'Aiquara', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1835, '2900702', 'Alagoinhas', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1836, '2900801', 'Alcobaça', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1837, '2900900', 'Almadina', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1838, '2901007', 'Amargosa', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1839, '2901106', 'Amélia Rodrigues', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1840, '2901155', 'América Dourada', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1841, '2901205', 'Anagé', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1842, '2901304', 'Andaraí', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1843, '2901353', 'Andorinha', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1844, '2901403', 'Angical', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1845, '2901502', 'Anguera', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1846, '2901601', 'Antas', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1847, '2901700', 'Antônio Cardoso', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1848, '2901809', 'Antônio Gonçalves', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1849, '2901908', 'Aporá', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1850, '2901957', 'Apuarema', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1851, '2902005', 'Aracatu', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1852, '2902054', 'Araças', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1853, '2902104', 'Araci', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1854, '2902203', 'Aramari', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1855, '2902252', 'Arataca', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1856, '2902302', 'Aratuípe', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1857, '2902401', 'Aurelino Leal', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1858, '2902500', 'Baianópolis', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1859, '2902609', 'Baixa Grande', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1860, '2902658', 'Banzaê', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1861, '2902708', 'Barra', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1862, '2902807', 'Barra da Estiva', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1863, '2902906', 'Barra do Choça', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1864, '2903003', 'Barra do Mendes', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1865, '2903102', 'Barra do Rocha', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1866, '2903201', 'Barreiras', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1867, '2903235', 'Barro Alto', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1868, '2903276', 'Barrocas', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1869, '2903300', 'Barro Preto', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1870, '2903409', 'Belmonte', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1871, '2903508', 'Belo Campo', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1872, '2903607', 'Biritinga', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1873, '2903706', 'Boa Nova', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1874, '2903805', 'Boa Vista do Tupim', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1875, '2903904', 'Bom Jesus da Lapa', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1876, '2903953', 'Bom Jesus da Serra', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1877, '2904001', 'Boninal', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1878, '2904050', 'Bonito', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1879, '2904100', 'Boquira', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1880, '2904209', 'Botuporã', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1881, '2904308', 'Brejões', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1882, '2904407', 'Brejolândia', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1883, '2904506', 'Brotas de Macaúbas', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1884, '2904605', 'Brumado', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1885, '2904704', 'Buerarema', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1886, '2904753', 'Buritirama', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1887, '2904803', 'Caatiba', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1888, '2904852', 'Cabaceiras do Paraguaçu', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1889, '2904902', 'Cachoeira', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1890, '2905008', 'Caculé', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1891, '2905107', 'Caém', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1892, '2905156', 'Caetanos', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1893, '2905206', 'Caetité', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1894, '2905305', 'Cafarnaum', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1895, '2905404', 'Cairu', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1896, '2905503', 'Caldeirão Grande', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1897, '2905602', 'Camacan', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1898, '2905701', 'Camaçari', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1899, '2905800', 'Camamu', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1900, '2905909', 'Campo Alegre de Lourdes', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1901, '2906006', 'Campo Formoso', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1902, '2906105', 'Canápolis', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1903, '2906204', 'Canarana', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1904, '2906303', 'Canavieiras', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1905, '2906402', 'Candeal', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1906, '2906501', 'Candeias', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1907, '2906600', 'Candiba', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1908, '2906709', 'Cândido Sales', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1909, '2906808', 'Cansanção', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1910, '2906824', 'Canudos', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1911, '2906857', 'Capela do Alto Alegre', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1912, '2906873', 'Capim Grosso', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1913, '2906899', 'Caraíbas', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1914, '2906907', 'Caravelas', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1915, '2907004', 'Cardeal da Silva', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1916, '2907103', 'Carinhanha', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1917, '2907202', 'Casa Nova', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1918, '2907301', 'Castro Alves', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1919, '2907400', 'Catolândia', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1920, '2907509', 'Catu', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1921, '2907558', 'Caturama', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1922, '2907608', 'Central', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1923, '2907707', 'Chorrochó', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1924, '2907806', 'Cícero Dantas', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1925, '2907905', 'Cipó', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1926, '2908002', 'Coaraci', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1927, '2908101', 'Cocos', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1928, '2908200', 'Conceição da Feira', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1929, '2908309', 'Conceição do Almeida', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1930, '2908408', 'Conceição do Coité', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1931, '2908507', 'Conceição do Jacuípe', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1932, '2908606', 'Conde', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1933, '2908705', 'Condeúba', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1934, '2908804', 'Contendas do Sincorá', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1935, '2908903', 'Coração de Maria', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1936, '2909000', 'Cordeiros', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1937, '2909109', 'Coribe', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1938, '2909208', 'Coronel João Sá', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1939, '2909307', 'Correntina', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1940, '2909406', 'Cotegipe', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1941, '2909505', 'Cravolândia', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1942, '2909604', 'Crisópolis', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1943, '2909703', 'Cristópolis', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1944, '2909802', 'Cruz das Almas', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1945, '2909901', 'Curaçá', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1946, '2910008', 'Dário Meira', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1947, '2910057', 'Dias D\'Ávila', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1948, '2910107', 'Dom Basílio', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1949, '2910206', 'Dom Macedo Costa', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1950, '2910305', 'Elísio Medrado', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1951, '2910404', 'Encruzilhada', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1952, '2910503', 'Entre Rios', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1953, '2910602', 'Esplanada', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1954, '2910701', 'Euclides da Cunha', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1955, '2910727', 'Eunápolis', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1956, '2910750', 'Fátima', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1957, '2910776', 'Feira da Mata', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1958, '2910800', 'Feira de Santana', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1959, '2910859', 'Filadélfia', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1960, '2910909', 'Firmino Alves', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1961, '2911006', 'Floresta Azul', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1962, '2911105', 'Formosa do Rio Preto', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1963, '2911204', 'Gandu', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1964, '2911253', 'Gavião', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1965, '2911303', 'Gentio do Ouro', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1966, '2911402', 'Glória', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1967, '2911501', 'Gongogi', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1968, '2911600', 'Governador Mangabeira', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1969, '2911659', 'Guajeru', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1970, '2911709', 'Guanambi', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1971, '2911808', 'Guaratinga', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1972, '2911857', 'Heliópolis', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1973, '2911907', 'Iaçu', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1974, '2912004', 'Ibiassucê', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1975, '2912103', 'Ibicaraí', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1976, '2912202', 'Ibicoara', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1977, '2912301', 'Ibicuí', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1978, '2912400', 'Ibipeba', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1979, '2912509', 'Ibipitanga', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1980, '2912608', 'Ibiquera', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1981, '2912707', 'Ibirapitanga', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1982, '2912806', 'Ibirapuã', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1983, '2912905', 'Ibirataia', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1984, '2913002', 'Ibitiara', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1985, '2913101', 'Ibititá', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1986, '2913200', 'Ibotirama', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1987, '2913309', 'Ichu', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1988, '2913408', 'Igaporã', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1989, '2913457', 'Igrapiúna', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1990, '2913507', 'Iguaí', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1991, '2913606', 'Ilhéus', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1992, '2913705', 'Inhambupe', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1993, '2913804', 'Ipecaetá', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1994, '2913903', 'Ipiaú', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1995, '2914000', 'Ipirá', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1996, '2914109', 'Ipupiara', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1997, '2914208', 'Irajuba', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1998, '2914307', 'Iramaia', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(1999, '2914406', 'Iraquara', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2000, '2914505', 'Irará', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2001, '2914604', 'Irecê', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2002, '2914653', 'Itabela', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2003, '2914703', 'Itaberaba', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2004, '2914802', 'Itabuna', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2005, '2914901', 'Itacaré', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2006, '2915007', 'Itaeté', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2007, '2915106', 'Itagi', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2008, '2915205', 'Itagibá', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2009, '2915304', 'Itagimirim', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2010, '2915353', 'Itaguaçu da Bahia', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2011, '2915403', 'Itaju do Colônia', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2012, '2915502', 'Itajuípe', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2013, '2915601', 'Itamaraju', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2014, '2915700', 'Itamari', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2015, '2915809', 'Itambé', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2016, '2915908', 'Itanagra', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2017, '2916005', 'Itanhém', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2018, '2916104', 'Itaparica', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2019, '2916203', 'Itapé', 'BA', '2024-06-14 16:39:05', '2024-06-14 16:39:05'),
(2020, '2916302', 'Itapebi', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2021, '2916401', 'Itapetinga', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2022, '2916500', 'Itapicuru', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2023, '2916609', 'Itapitanga', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2024, '2916708', 'Itaquara', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2025, '2916807', 'Itarantim', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2026, '2916856', 'Itatim', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2027, '2916906', 'Itiruçu', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2028, '2917003', 'Itiúba', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2029, '2917102', 'Itororó', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2030, '2917201', 'Ituaçu', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2031, '2917300', 'Ituberá', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2032, '2917334', 'Iuiú', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2033, '2917359', 'Jaborandi', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2034, '2917409', 'Jacaraci', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2035, '2917508', 'Jacobina', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2036, '2917607', 'Jaguaquara', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2037, '2917706', 'Jaguarari', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2038, '2917805', 'Jaguaripe', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2039, '2917904', 'Jandaíra', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2040, '2918001', 'Jequié', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2041, '2918100', 'Jeremoabo', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2042, '2918209', 'Jiquiriçá', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2043, '2918308', 'Jitaúna', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2044, '2918357', 'João Dourado', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2045, '2918407', 'Juazeiro', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2046, '2918456', 'Jucuruçu', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2047, '2918506', 'Jussara', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2048, '2918555', 'Jussari', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2049, '2918605', 'Jussiape', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2050, '2918704', 'Lafaiete Coutinho', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2051, '2918753', 'Lagoa Real', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2052, '2918803', 'Laje', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2053, '2918902', 'Lajedão', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2054, '2919009', 'Lajedinho', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2055, '2919058', 'Lajedo do Tabocal', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2056, '2919108', 'Lamarão', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2057, '2919157', 'Lapão', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2058, '2919207', 'Lauro de Freitas', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2059, '2919306', 'Lençóis', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2060, '2919405', 'Licínio de Almeida', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2061, '2919504', 'Livramento de Nossa Senhora', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2062, '2919553', 'Luís Eduardo Magalhães', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2063, '2919603', 'Macajuba', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2064, '2919702', 'Macarani', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2065, '2919801', 'Macaúbas', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2066, '2919900', 'Macururé', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2067, '2919926', 'Madre de Deus', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2068, '2919959', 'Maetinga', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2069, '2920007', 'Maiquinique', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2070, '2920106', 'Mairi', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2071, '2920205', 'Malhada', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2072, '2920304', 'Malhada de Pedras', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2073, '2920403', 'Manoel Vitorino', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2074, '2920452', 'Mansidão', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2075, '2920502', 'Maracás', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2076, '2920601', 'Maragogipe', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2077, '2920700', 'Maraú', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2078, '2920809', 'Marcionílio Souza', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2079, '2920908', 'Mascote', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2080, '2921005', 'Mata de São João', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2081, '2921054', 'Matina', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2082, '2921104', 'Medeiros Neto', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2083, '2921203', 'Miguel Calmon', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2084, '2921302', 'Milagres', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2085, '2921401', 'Mirangaba', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2086, '2921450', 'Mirante', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2087, '2921500', 'Monte Santo', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2088, '2921609', 'Morpará', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2089, '2921708', 'Morro do Chapéu', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2090, '2921807', 'Mortugaba', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2091, '2921906', 'Mucugê', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2092, '2922003', 'Mucuri', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2093, '2922052', 'Mulungu do Morro', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2094, '2922102', 'Mundo Novo', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2095, '2922201', 'Muniz Ferreira', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2096, '2922250', 'Muquém de São Francisco', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2097, '2922300', 'Muritiba', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2098, '2922409', 'Mutuípe', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2099, '2922508', 'Nazaré', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2100, '2922607', 'Nilo Peçanha', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2101, '2922656', 'Nordestina', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2102, '2922706', 'Nova Canaã', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2103, '2922730', 'Nova Fátima', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2104, '2922755', 'Nova Ibiá', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2105, '2922805', 'Nova Itarana', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2106, '2922854', 'Nova Redenção', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2107, '2922904', 'Nova Soure', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2108, '2923001', 'Nova Viçosa', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2109, '2923035', 'Novo Horizonte', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2110, '2923050', 'Novo Triunfo', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2111, '2923100', 'Olindina', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2112, '2923209', 'Oliveira dos Brejinhos', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2113, '2923308', 'Ouriçangas', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2114, '2923357', 'Ourolândia', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2115, '2923407', 'Palmas de Monte Alto', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2116, '2923506', 'Palmeiras', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2117, '2923605', 'Paramirim', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2118, '2923704', 'Paratinga', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2119, '2923803', 'Paripiranga', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2120, '2923902', 'Pau Brasil', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2121, '2924009', 'Paulo Afonso', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2122, '2924058', 'Pé de Serra', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2123, '2924108', 'Pedrão', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2124, '2924207', 'Pedro Alexandre', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2125, '2924306', 'Piatã', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2126, '2924405', 'Pilão Arcado', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2127, '2924504', 'Pindaí', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2128, '2924603', 'Pindobaçu', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2129, '2924652', 'Pintadas', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2130, '2924678', 'Piraí do Norte', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2131, '2924702', 'Piripá', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2132, '2924801', 'Piritiba', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2133, '2924900', 'Planaltino', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2134, '2925006', 'Planalto', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2135, '2925105', 'Poções', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2136, '2925204', 'Pojuca', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2137, '2925253', 'Ponto Novo', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2138, '2925303', 'Porto Seguro', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2139, '2925402', 'Potiraguá', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2140, '2925501', 'Prado', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2141, '2925600', 'Presidente Dutra', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2142, '2925709', 'Presidente Jânio Quadros', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2143, '2925758', 'Presidente Tancredo Neves', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2144, '2925808', 'Queimadas', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2145, '2925907', 'Quijingue', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2146, '2925931', 'Quixabeira', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2147, '2925956', 'Rafael Jambeiro', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2148, '2926004', 'Remanso', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2149, '2926103', 'Retirolândia', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2150, '2926202', 'Riachão das Neves', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2151, '2926301', 'Riachão do Jacuípe', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2152, '2926400', 'Riacho de Santana', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2153, '2926509', 'Ribeira do Amparo', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2154, '2926608', 'Ribeira do Pombal', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2155, '2926657', 'Ribeirão do Largo', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2156, '2926707', 'Rio de Contas', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2157, '2926806', 'Rio do Antônio', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2158, '2926905', 'Rio do Pires', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2159, '2927002', 'Rio Real', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2160, '2927101', 'Rodelas', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2161, '2927200', 'Ruy Barbosa', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2162, '2927309', 'Salinas da Margarida', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2163, '2927408', 'Salvador', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2164, '2927507', 'Santa Bárbara', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2165, '2927606', 'Santa Brígida', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2166, '2927705', 'Santa Cruz Cabrália', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2167, '2927804', 'Santa Cruz da Vitória', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2168, '2927903', 'Santa Inês', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2169, '2928000', 'Santaluz', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2170, '2928059', 'Santa Luzia', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2171, '2928109', 'Santa Maria da Vitória', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2172, '2928208', 'Santana', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2173, '2928307', 'Santanópolis', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2174, '2928406', 'Santa Rita de Cássia', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2175, '2928505', 'Santa Teresinha', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2176, '2928604', 'Santo Amaro', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2177, '2928703', 'Santo Antônio de Jesus', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2178, '2928802', 'Santo Estêvão', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2179, '2928901', 'São Desidério', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2180, '2928950', 'São Domingos', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2181, '2929008', 'São Félix', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2182, '2929057', 'São Félix do Coribe', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2183, '2929107', 'São Felipe', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2184, '2929206', 'São Francisco do Conde', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2185, '2929255', 'São Gabriel', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2186, '2929305', 'São Gonçalo dos Campos', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2187, '2929354', 'São José da Vitória', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2188, '2929370', 'São José do Jacuípe', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2189, '2929404', 'São Miguel das Matas', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2190, '2929503', 'São Sebastião do Passé', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2191, '2929602', 'Sapeaçu', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2192, '2929701', 'Sátiro Dias', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2193, '2929750', 'Saubara', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2194, '2929800', 'Saúde', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2195, '2929909', 'Seabra', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2196, '2930006', 'Sebastião Laranjeiras', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2197, '2930105', 'Senhor do Bonfim', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2198, '2930154', 'Serra do Ramalho', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2199, '2930204', 'Sento Sé', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2200, '2930303', 'Serra Dourada', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2201, '2930402', 'Serra Preta', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2202, '2930501', 'Serrinha', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2203, '2930600', 'Serrolândia', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2204, '2930709', 'Simões Filho', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2205, '2930758', 'Sítio do Mato', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2206, '2930766', 'Sítio do Quinto', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2207, '2930774', 'Sobradinho', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2208, '2930808', 'Souto Soares', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2209, '2930907', 'Tabocas do Brejo Velho', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2210, '2931004', 'Tanhaçu', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2211, '2931053', 'Tanque Novo', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2212, '2931103', 'Tanquinho', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2213, '2931202', 'Taperoá', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2214, '2931301', 'Tapiramutá', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2215, '2931350', 'Teixeira de Freitas', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2216, '2931400', 'Teodoro Sampaio', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2217, '2931509', 'Teofilândia', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2218, '2931608', 'Teolândia', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2219, '2931707', 'Terra Nova', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2220, '2931806', 'Tremedal', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2221, '2931905', 'Tucano', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2222, '2932002', 'Uauá', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2223, '2932101', 'Ubaíra', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2224, '2932200', 'Ubaitaba', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2225, '2932309', 'Ubatã', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2226, '2932408', 'Uibaí', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2227, '2932457', 'Umburanas', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2228, '2932507', 'Una', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2229, '2932606', 'Urandi', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2230, '2932705', 'Uruçuca', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2231, '2932804', 'Utinga', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2232, '2932903', 'Valença', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2233, '2933000', 'Valente', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2234, '2933059', 'Várzea da Roça', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2235, '2933109', 'Várzea do Poço', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2236, '2933158', 'Várzea Nova', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2237, '2933174', 'Varzedo', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2238, '2933208', 'Vera Cruz', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2239, '2933257', 'Vereda', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2240, '2933307', 'Vitória da Conquista', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2241, '2933406', 'Wagner', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2242, '2933455', 'Wanderley', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2243, '2933505', 'Wenceslau Guimarães', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2244, '2933604', 'Xique-Xique', 'BA', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2245, '3100104', 'Abadia dos Dourados', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2246, '3100203', 'Abaeté', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2247, '3100302', 'Abre Campo', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2248, '3100401', 'Acaiaca', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2249, '3100500', 'Açucena', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2250, '3100609', 'Água Boa', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2251, '3100708', 'Água Comprida', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2252, '3100807', 'Aguanil', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2253, '3100906', 'Águas Formosas', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2254, '3101003', 'Águas Vermelhas', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2255, '3101102', 'Aimorés', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2256, '3101201', 'Aiuruoca', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2257, '3101300', 'Alagoa', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2258, '3101409', 'Albertina', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2259, '3101508', 'Além Paraíba', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2260, '3101607', 'Alfenas', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2261, '3101631', 'Alfredo Vasconcelos', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2262, '3101706', 'Almenara', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2263, '3101805', 'Alpercata', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2264, '3101904', 'Alpinópolis', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2265, '3102001', 'Alterosa', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2266, '3102050', 'Alto Caparaó', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2267, '3102100', 'Alto Rio Doce', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2268, '3102209', 'Alvarenga', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2269, '3102308', 'Alvinópolis', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2270, '3102407', 'Alvorada de Minas', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2271, '3102506', 'Amparo do Serra', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2272, '3102605', 'Andradas', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2273, '3102704', 'Cachoeira de Pajeú', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2274, '3102803', 'Andrelândia', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2275, '3102852', 'Angelândia', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2276, '3102902', 'Antônio Carlos', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2277, '3103009', 'Antônio Dias', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2278, '3103108', 'Antônio Prado de Minas', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2279, '3103207', 'Araçaí', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2280, '3103306', 'Aracitaba', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2281, '3103405', 'Araçuaí', 'MG', '2024-06-14 16:39:06', '2024-06-14 16:39:06'),
(2282, '3103504', 'Araguari', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2283, '3103603', 'Arantina', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2284, '3103702', 'Araponga', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2285, '3103751', 'Araporã', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2286, '3103801', 'Arapuá', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2287, '3103900', 'Araújos', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2288, '3104007', 'Araxá', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2289, '3104106', 'Arceburgo', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2290, '3104205', 'Arcos', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2291, '3104304', 'Areado', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2292, '3104403', 'Argirita', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2293, '3104452', 'Aricanduva', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2294, '3104502', 'Arinos', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2295, '3104601', 'Astolfo Dutra', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2296, '3104700', 'Ataléia', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2297, '3104809', 'Augusto de Lima', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2298, '3104908', 'Baependi', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2299, '3105004', 'Baldim', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2300, '3105103', 'Bambuí', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2301, '3105202', 'Bandeira', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2302, '3105301', 'Bandeira do Sul', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2303, '3105400', 'Barão de Cocais', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2304, '3105509', 'Barão de Monte Alto', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2305, '3105608', 'Barbacena', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2306, '3105707', 'Barra Longa', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2307, '3105905', 'Barroso', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2308, '3106002', 'Bela Vista de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2309, '3106101', 'Belmiro Braga', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2310, '3106200', 'Belo Horizonte', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2311, '3106309', 'Belo Oriente', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2312, '3106408', 'Belo Vale', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2313, '3106507', 'Berilo', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2314, '3106606', 'Bertópolis', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2315, '3106655', 'Berizal', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2316, '3106705', 'Betim', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2317, '3106804', 'Bias Fortes', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2318, '3106903', 'Bicas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2319, '3107000', 'Biquinhas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2320, '3107109', 'Boa Esperança', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2321, '3107208', 'Bocaina de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2322, '3107307', 'Bocaiúva', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2323, '3107406', 'Bom Despacho', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2324, '3107505', 'Bom Jardim de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2325, '3107604', 'Bom Jesus da Penha', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2326, '3107703', 'Bom Jesus do Amparo', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2327, '3107802', 'Bom Jesus do Galho', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2328, '3107901', 'Bom Repouso', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2329, '3108008', 'Bom Sucesso', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2330, '3108107', 'Bonfim', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2331, '3108206', 'Bonfinópolis de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2332, '3108255', 'Bonito de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2333, '3108305', 'Borda da Mata', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2334, '3108404', 'Botelhos', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2335, '3108503', 'Botumirim', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2336, '3108552', 'Brasilândia de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2337, '3108602', 'Brasília de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2338, '3108701', 'Brás Pires', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2339, '3108800', 'Braúnas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2340, '3108909', 'Brazópolis', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2341, '3109006', 'Brumadinho', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2342, '3109105', 'Bueno Brandão', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2343, '3109204', 'Buenópolis', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2344, '3109253', 'Bugre', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2345, '3109303', 'Buritis', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2346, '3109402', 'Buritizeiro', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2347, '3109451', 'Cabeceira Grande', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2348, '3109501', 'Cabo Verde', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2349, '3109600', 'Cachoeira da Prata', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2350, '3109709', 'Cachoeira de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2351, '3109808', 'Cachoeira Dourada', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2352, '3109907', 'Caetanópolis', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2353, '3110004', 'Caeté', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2354, '3110103', 'Caiana', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2355, '3110202', 'Cajuri', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2356, '3110301', 'Caldas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2357, '3110400', 'Camacho', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2358, '3110509', 'Camanducaia', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2359, '3110608', 'Cambuí', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2360, '3110707', 'Cambuquira', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2361, '3110806', 'Campanário', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2362, '3110905', 'Campanha', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2363, '3111002', 'Campestre', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2364, '3111101', 'Campina Verde', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2365, '3111150', 'Campo Azul', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2366, '3111200', 'Campo Belo', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2367, '3111309', 'Campo do Meio', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2368, '3111408', 'Campo Florido', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2369, '3111507', 'Campos Altos', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2370, '3111606', 'Campos Gerais', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2371, '3111705', 'Canaã', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(2372, '3111804', 'Canápolis', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2373, '3111903', 'Cana Verde', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2374, '3112000', 'Candeias', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2375, '3112059', 'Cantagalo', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2376, '3112109', 'Caparaó', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2377, '3112208', 'Capela Nova', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2378, '3112307', 'Capelinha', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2379, '3112406', 'Capetinga', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2380, '3112505', 'Capim Branco', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2381, '3112604', 'Capinópolis', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2382, '3112653', 'Capitão Andrade', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2383, '3112703', 'Capitão Enéas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2384, '3112802', 'Capitólio', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2385, '3112901', 'Caputira', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2386, '3113008', 'Caraí', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2387, '3113107', 'Caranaíba', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2388, '3113206', 'Carandaí', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2389, '3113305', 'Carangola', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2390, '3113404', 'Caratinga', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2391, '3113503', 'Carbonita', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2392, '3113602', 'Careaçu', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2393, '3113701', 'Carlos Chagas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2394, '3113800', 'Carmésia', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2395, '3113909', 'Carmo da Cachoeira', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2396, '3114006', 'Carmo da Mata', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2397, '3114105', 'Carmo de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2398, '3114204', 'Carmo do Cajuru', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2399, '3114303', 'Carmo do Paranaíba', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2400, '3114402', 'Carmo do Rio Claro', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2401, '3114501', 'Carmópolis de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2402, '3114550', 'Carneirinho', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2403, '3114600', 'Carrancas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2404, '3114709', 'Carvalhópolis', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2405, '3114808', 'Carvalhos', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2406, '3114907', 'Casa Grande', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2407, '3115003', 'Cascalho Rico', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2408, '3115102', 'Cássia', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2409, '3115201', 'Conceição da Barra de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2410, '3115300', 'Cataguases', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2411, '3115359', 'Catas Altas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2412, '3115409', 'Catas Altas da Noruega', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2413, '3115458', 'Catuji', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2414, '3115474', 'Catuti', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2415, '3115508', 'Caxambu', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2416, '3115607', 'Cedro do Abaeté', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2417, '3115706', 'Central de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2418, '3115805', 'Centralina', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2419, '3115904', 'Chácara', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2420, '3116001', 'Chalé', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2421, '3116100', 'Chapada do Norte', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2422, '3116159', 'Chapada Gaúcha', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2423, '3116209', 'Chiador', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2424, '3116308', 'Cipotânea', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2425, '3116407', 'Claraval', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2426, '3116506', 'Claro dos Poções', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2427, '3116605', 'Cláudio', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2428, '3116704', 'Coimbra', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2429, '3116803', 'Coluna', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2430, '3116902', 'Comendador Gomes', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2431, '3117009', 'Comercinho', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2432, '3117108', 'Conceição da Aparecida', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2433, '3117207', 'Conceição das Pedras', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2434, '3117306', 'Conceição das Alagoas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2435, '3117405', 'Conceição de Ipanema', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2436, '3117504', 'Conceição do Mato Dentro', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2437, '3117603', 'Conceição do Pará', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2438, '3117702', 'Conceição do Rio Verde', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2439, '3117801', 'Conceição dos Ouros', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2440, '3117836', 'Cônego Marinho', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2441, '3117876', 'Confins', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2442, '3117900', 'Congonhal', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2443, '3118007', 'Congonhas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2444, '3118106', 'Congonhas do Norte', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2445, '3118205', 'Conquista', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2446, '3118304', 'Conselheiro Lafaiete', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2447, '3118403', 'Conselheiro Pena', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2448, '3118502', 'Consolação', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2449, '3118601', 'Contagem', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2450, '3118700', 'Coqueiral', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2451, '3118809', 'Coração de Jesus', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2452, '3118908', 'Cordisburgo', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2453, '3119005', 'Cordislândia', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2454, '3119104', 'Corinto', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2455, '3119203', 'Coroaci', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2456, '3119302', 'Coromandel', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2457, '3119401', 'Coronel Fabriciano', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2458, '3119500', 'Coronel Murta', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2459, '3119609', 'Coronel Pacheco', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2460, '3119708', 'Coronel Xavier Chaves', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2461, '3119807', 'Córrego Danta', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2462, '3119906', 'Córrego do Bom Jesus', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2463, '3119955', 'Córrego Fundo', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2464, '3120003', 'Córrego Novo', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2465, '3120102', 'Couto de Magalhães de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2466, '3120151', 'Crisólita', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2467, '3120201', 'Cristais', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2468, '3120300', 'Cristália', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2469, '3120409', 'Cristiano Otoni', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2470, '3120508', 'Cristina', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2471, '3120607', 'Crucilândia', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2472, '3120706', 'Cruzeiro da Fortaleza', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2473, '3120805', 'Cruzília', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2474, '3120839', 'Cuparaque', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2475, '3120870', 'Curral de Dentro', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2476, '3120904', 'Curvelo', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2477, '3121001', 'Datas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2478, '3121100', 'Delfim Moreira', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2479, '3121209', 'Delfinópolis', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2480, '3121258', 'Delta', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2481, '3121308', 'Descoberto', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2482, '3121407', 'Desterro de Entre Rios', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2483, '3121506', 'Desterro do Melo', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2484, '3121605', 'Diamantina', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2485, '3121704', 'Diogo de Vasconcelos', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2486, '3121803', 'Dionísio', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2487, '3121902', 'Divinésia', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2488, '3122009', 'Divino', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2489, '3122108', 'Divino das Laranjeiras', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2490, '3122207', 'Divinolândia de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2491, '3122306', 'Divinópolis', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2492, '3122355', 'Divisa Alegre', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2493, '3122405', 'Divisa Nova', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2494, '3122454', 'Divisópolis', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2495, '3122470', 'Dom Bosco', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2496, '3122504', 'Dom Cavati', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2497, '3122603', 'Dom Joaquim', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2498, '3122702', 'Dom Silvério', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2499, '3122801', 'Dom Viçoso', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2500, '3122900', 'Dona Eusébia', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2501, '3123007', 'Dores de Campos', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2502, '3123106', 'Dores de Guanhães', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2503, '3123205', 'Dores do Indaiá', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2504, '3123304', 'Dores do Turvo', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2505, '3123403', 'Doresópolis', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2506, '3123502', 'Douradoquara', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2507, '3123528', 'Durandé', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2508, '3123601', 'Elói Mendes', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2509, '3123700', 'Engenheiro Caldas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2510, '3123809', 'Engenheiro Navarro', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2511, '3123858', 'Entre Folhas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2512, '3123908', 'Entre Rios de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2513, '3124005', 'Ervália', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2514, '3124104', 'Esmeraldas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2515, '3124203', 'Espera Feliz', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2516, '3124302', 'Espinosa', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2517, '3124401', 'Espírito Santo do Dourado', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2518, '3124500', 'Estiva', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2519, '3124609', 'Estrela Dalva', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2520, '3124708', 'Estrela do Indaiá', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2521, '3124807', 'Estrela do Sul', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2522, '3124906', 'Eugenópolis', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2523, '3125002', 'Ewbank da Câmara', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2524, '3125101', 'Extrema', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2525, '3125200', 'Fama', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2526, '3125309', 'Faria Lemos', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2527, '3125408', 'Felício dos Santos', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2528, '3125507', 'São Gonçalo do Rio Preto', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2529, '3125606', 'Felisburgo', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2530, '3125705', 'Felixlândia', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2531, '3125804', 'Fernandes Tourinho', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2532, '3125903', 'Ferros', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2533, '3125952', 'Fervedouro', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2534, '3126000', 'Florestal', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2535, '3126109', 'Formiga', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2536, '3126208', 'Formoso', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2537, '3126307', 'Fortaleza de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2538, '3126406', 'Fortuna de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2539, '3126505', 'Francisco Badaró', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2540, '3126604', 'Francisco Dumont', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2541, '3126703', 'Francisco Sá', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2542, '3126752', 'Franciscópolis', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2543, '3126802', 'Frei Gaspar', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2544, '3126901', 'Frei Inocêncio', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2545, '3126950', 'Frei Lagonegro', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2546, '3127008', 'Fronteira', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2547, '3127057', 'Fronteira dos Vales', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2548, '3127073', 'Fruta de Leite', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2549, '3127107', 'Frutal', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2550, '3127206', 'Funilândia', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2551, '3127305', 'Galiléia', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2552, '3127339', 'Gameleiras', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2553, '3127354', 'Glaucilândia', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2554, '3127370', 'Goiabeira', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2555, '3127388', 'Goianá', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2556, '3127404', 'Gonçalves', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2557, '3127503', 'Gonzaga', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2558, '3127602', 'Gouveia', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2559, '3127701', 'Governador Valadares', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2560, '3127800', 'Grão Mogol', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2561, '3127909', 'Grupiara', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2562, '3128006', 'Guanhães', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2563, '3128105', 'Guapé', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2564, '3128204', 'Guaraciaba', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2565, '3128253', 'Guaraciama', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2566, '3128303', 'Guaranésia', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2567, '3128402', 'Guarani', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2568, '3128501', 'Guarará', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2569, '3128600', 'Guarda-Mor', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2570, '3128709', 'Guaxupé', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2571, '3128808', 'Guidoval', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2572, '3128907', 'Guimarânia', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2573, '3129004', 'Guiricema', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2574, '3129103', 'Gurinhatã', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2575, '3129202', 'Heliodora', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2576, '3129301', 'Iapu', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2577, '3129400', 'Ibertioga', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2578, '3129509', 'Ibiá', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2579, '3129608', 'Ibiaí', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2580, '3129657', 'Ibiracatu', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2581, '3129707', 'Ibiraci', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2582, '3129806', 'Ibirité', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2583, '3129905', 'Ibitiúra de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2584, '3130002', 'Ibituruna', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2585, '3130051', 'Icaraí de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2586, '3130101', 'Igarapé', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2587, '3130200', 'Igaratinga', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2588, '3130309', 'Iguatama', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2589, '3130408', 'Ijaci', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2590, '3130507', 'Ilicínea', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2591, '3130556', 'Imbé de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2592, '3130606', 'Inconfidentes', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2593, '3130655', 'Indaiabira', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2594, '3130705', 'Indianópolis', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2595, '3130804', 'Ingaí', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2596, '3130903', 'Inhapim', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2597, '3131000', 'Inhaúma', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2598, '3131109', 'Inimutaba', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2599, '3131158', 'Ipaba', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2600, '3131208', 'Ipanema', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2601, '3131307', 'Ipatinga', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2602, '3131406', 'Ipiaçu', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2603, '3131505', 'Ipuiúna', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2604, '3131604', 'Iraí de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2605, '3131703', 'Itabira', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2606, '3131802', 'Itabirinha', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2607, '3131901', 'Itabirito', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2608, '3132008', 'Itacambira', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2609, '3132107', 'Itacarambi', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2610, '3132206', 'Itaguara', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2611, '3132305', 'Itaipé', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2612, '3132404', 'Itajubá', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2613, '3132503', 'Itamarandiba', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2614, '3132602', 'Itamarati de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2615, '3132701', 'Itambacuri', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2616, '3132800', 'Itambé do Mato Dentro', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2617, '3132909', 'Itamogi', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2618, '3133006', 'Itamonte', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2619, '3133105', 'Itanhandu', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2620, '3133204', 'Itanhomi', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2621, '3133303', 'Itaobim', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2622, '3133402', 'Itapagipe', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2623, '3133501', 'Itapecerica', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2624, '3133600', 'Itapeva', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2625, '3133709', 'Itatiaiuçu', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2626, '3133758', 'Itaú de Minas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2627, '3133808', 'Itaúna', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2628, '3133907', 'Itaverava', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2629, '3134004', 'Itinga', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2630, '3134103', 'Itueta', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2631, '3134202', 'Ituiutaba', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2632, '3134301', 'Itumirim', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2633, '3134400', 'Iturama', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2634, '3134509', 'Itutinga', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2635, '3134608', 'Jaboticatubas', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2636, '3134707', 'Jacinto', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2637, '3134806', 'Jacuí', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2638, '3134905', 'Jacutinga', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2639, '3135001', 'Jaguaraçu', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2640, '3135050', 'Jaíba', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2641, '3135076', 'Jampruca', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2642, '3135100', 'Janaúba', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2643, '3135209', 'Januária', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2644, '3135308', 'Japaraíba', 'MG', '2024-06-14 16:39:07', '2024-06-14 16:39:07'),
(2645, '3135357', 'Japonvar', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2646, '3135407', 'Jeceaba', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2647, '3135456', 'Jenipapo de Minas', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2648, '3135506', 'Jequeri', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2649, '3135605', 'Jequitaí', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2650, '3135704', 'Jequitibá', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2651, '3135803', 'Jequitinhonha', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2652, '3135902', 'Jesuânia', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2653, '3136009', 'Joaíma', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2654, '3136108', 'Joanésia', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2655, '3136207', 'João Monlevade', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2656, '3136306', 'João Pinheiro', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2657, '3136405', 'Joaquim Felício', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2658, '3136504', 'Jordânia', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2659, '3136520', 'José Gonçalves de Minas', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2660, '3136553', 'José Raydan', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2661, '3136579', 'Josenópolis', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2662, '3136603', 'Nova União', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2663, '3136652', 'Juatuba', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2664, '3136702', 'Juiz de Fora', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2665, '3136801', 'Juramento', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2666, '3136900', 'Juruaia', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2667, '3136959', 'Juvenília', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2668, '3137007', 'Ladainha', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2669, '3137106', 'Lagamar', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2670, '3137205', 'Lagoa da Prata', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2671, '3137304', 'Lagoa dos Patos', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2672, '3137403', 'Lagoa Dourada', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2673, '3137502', 'Lagoa Formosa', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2674, '3137536', 'Lagoa Grande', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2675, '3137601', 'Lagoa Santa', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2676, '3137700', 'Lajinha', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2677, '3137809', 'Lambari', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2678, '3137908', 'Lamim', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2679, '3138005', 'Laranjal', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2680, '3138104', 'Lassance', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2681, '3138203', 'Lavras', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2682, '3138302', 'Leandro Ferreira', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2683, '3138351', 'Leme do Prado', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2684, '3138401', 'Leopoldina', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2685, '3138500', 'Liberdade', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2686, '3138609', 'Lima Duarte', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2687, '3138625', 'Limeira do Oeste', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2688, '3138658', 'Lontra', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2689, '3138674', 'Luisburgo', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2690, '3138682', 'Luislândia', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2691, '3138708', 'Luminárias', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2692, '3138807', 'Luz', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2693, '3138906', 'Machacalis', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2694, '3139003', 'Machado', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2695, '3139102', 'Madre de Deus de Minas', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2696, '3139201', 'Malacacheta', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2697, '3139250', 'Mamonas', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2698, '3139300', 'Manga', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2699, '3139409', 'Manhuaçu', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2700, '3139508', 'Manhumirim', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2701, '3139607', 'Mantena', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2702, '3139706', 'Maravilhas', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2703, '3139805', 'Mar de Espanha', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2704, '3139904', 'Maria da Fé', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2705, '3140001', 'Mariana', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2706, '3140100', 'Marilac', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2707, '3140159', 'Mário Campos', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2708, '3140209', 'Maripá de Minas', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2709, '3140308', 'Marliéria', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2710, '3140407', 'Marmelópolis', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2711, '3140506', 'Martinho Campos', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2712, '3140530', 'Martins Soares', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2713, '3140555', 'Mata Verde', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2714, '3140605', 'Materlândia', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2715, '3140704', 'Mateus Leme', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2716, '3140803', 'Matias Barbosa', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2717, '3140852', 'Matias Cardoso', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2718, '3140902', 'Matipó', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2719, '3141009', 'Mato Verde', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2720, '3141108', 'Matozinhos', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2721, '3141207', 'Matutina', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2722, '3141306', 'Medeiros', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2723, '3141405', 'Medina', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2724, '3141504', 'Mendes Pimentel', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2725, '3141603', 'Mercês', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2726, '3141702', 'Mesquita', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2727, '3141801', 'Minas Novas', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2728, '3141900', 'Minduri', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2729, '3142007', 'Mirabela', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2730, '3142106', 'Miradouro', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2731, '3142205', 'Miraí', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2732, '3142254', 'Miravânia', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2733, '3142304', 'Moeda', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2734, '3142403', 'Moema', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2735, '3142502', 'Monjolos', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2736, '3142601', 'Monsenhor Paulo', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2737, '3142700', 'Montalvânia', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2738, '3142809', 'Monte Alegre de Minas', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2739, '3142908', 'Monte Azul', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2740, '3143005', 'Monte Belo', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2741, '3143104', 'Monte Carmelo', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2742, '3143153', 'Monte Formoso', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2743, '3143203', 'Monte Santo de Minas', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2744, '3143302', 'Montes Claros', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2745, '3143401', 'Monte Sião', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2746, '3143450', 'Montezuma', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2747, '3143500', 'Morada Nova de Minas', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2748, '3143609', 'Morro da Garça', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2749, '3143708', 'Morro do Pilar', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2750, '3143807', 'Munhoz', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2751, '3143906', 'Muriaé', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2752, '3144003', 'Mutum', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2753, '3144102', 'Muzambinho', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2754, '3144201', 'Nacip Raydan', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2755, '3144300', 'Nanuque', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2756, '3144359', 'Naque', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2757, '3144375', 'Natalândia', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2758, '3144409', 'Natércia', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2759, '3144508', 'Nazareno', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2760, '3144607', 'Nepomuceno', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2761, '3144656', 'Ninheira', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2762, '3144672', 'Nova Belém', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2763, '3144706', 'Nova Era', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2764, '3144805', 'Nova Lima', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2765, '3144904', 'Nova Módica', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2766, '3145000', 'Nova Ponte', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2767, '3145059', 'Nova Porteirinha', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2768, '3145109', 'Nova Resende', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2769, '3145208', 'Nova Serrana', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2770, '3145307', 'Novo Cruzeiro', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2771, '3145356', 'Novo Oriente de Minas', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2772, '3145372', 'Novorizonte', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2773, '3145406', 'Olaria', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2774, '3145455', 'Olhos-D\'Água', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2775, '3145505', 'Olímpio Noronha', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2776, '3145604', 'Oliveira', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2777, '3145703', 'Oliveira Fortes', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2778, '3145802', 'Onça de Pitangui', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2779, '3145851', 'Oratórios', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2780, '3145877', 'Orizânia', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2781, '3145901', 'Ouro Branco', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2782, '3146008', 'Ouro Fino', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2783, '3146107', 'Ouro Preto', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2784, '3146206', 'Ouro Verde de Minas', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2785, '3146255', 'Padre Carvalho', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2786, '3146305', 'Padre Paraíso', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2787, '3146404', 'Paineiras', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2788, '3146503', 'Pains', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2789, '3146552', 'Pai Pedro', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2790, '3146602', 'Paiva', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2791, '3146701', 'Palma', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2792, '3146750', 'Palmópolis', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2793, '3146909', 'Papagaios', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2794, '3147006', 'Paracatu', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2795, '3147105', 'Pará de Minas', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2796, '3147204', 'Paraguaçu', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2797, '3147303', 'Paraisópolis', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2798, '3147402', 'Paraopeba', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2799, '3147501', 'Passabém', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2800, '3147600', 'Passa Quatro', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2801, '3147709', 'Passa Tempo', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2802, '3147808', 'Passa-Vinte', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2803, '3147907', 'Passos', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2804, '3147956', 'Patis', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2805, '3148004', 'Patos de Minas', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2806, '3148103', 'Patrocínio', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2807, '3148202', 'Patrocínio do Muriaé', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2808, '3148301', 'Paula Cândido', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2809, '3148400', 'Paulistas', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2810, '3148509', 'Pavão', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2811, '3148608', 'Peçanha', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2812, '3148707', 'Pedra Azul', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2813, '3148756', 'Pedra Bonita', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2814, '3148806', 'Pedra do Anta', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2815, '3148905', 'Pedra do Indaiá', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2816, '3149002', 'Pedra Dourada', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2817, '3149101', 'Pedralva', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2818, '3149150', 'Pedras de Maria da Cruz', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2819, '3149200', 'Pedrinópolis', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2820, '3149309', 'Pedro Leopoldo', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2821, '3149408', 'Pedro Teixeira', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2822, '3149507', 'Pequeri', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2823, '3149606', 'Pequi', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2824, '3149705', 'Perdigão', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2825, '3149804', 'Perdizes', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2826, '3149903', 'Perdões', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2827, '3149952', 'Periquito', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2828, '3150000', 'Pescador', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2829, '3150109', 'Piau', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2830, '3150158', 'Piedade de Caratinga', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2831, '3150208', 'Piedade de Ponte Nova', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2832, '3150307', 'Piedade do Rio Grande', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2833, '3150406', 'Piedade dos Gerais', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2834, '3150505', 'Pimenta', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2835, '3150539', 'Pingo-D\'Água', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2836, '3150570', 'Pintópolis', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2837, '3150604', 'Piracema', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2838, '3150703', 'Pirajuba', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2839, '3150802', 'Piranga', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2840, '3150901', 'Piranguçu', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2841, '3151008', 'Piranguinho', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2842, '3151107', 'Pirapetinga', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2843, '3151206', 'Pirapora', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2844, '3151305', 'Piraúba', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2845, '3151404', 'Pitangui', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2846, '3151503', 'Piumhi', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2847, '3151602', 'Planura', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2848, '3151701', 'Poço Fundo', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2849, '3151800', 'Poços de Caldas', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2850, '3151909', 'Pocrane', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2851, '3152006', 'Pompéu', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2852, '3152105', 'Ponte Nova', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2853, '3152131', 'Ponto Chique', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2854, '3152170', 'Ponto dos Volantes', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2855, '3152204', 'Porteirinha', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2856, '3152303', 'Porto Firme', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2857, '3152402', 'Poté', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2858, '3152501', 'Pouso Alegre', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2859, '3152600', 'Pouso Alto', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2860, '3152709', 'Prados', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2861, '3152808', 'Prata', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2862, '3152907', 'Pratápolis', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2863, '3153004', 'Pratinha', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2864, '3153103', 'Presidente Bernardes', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2865, '3153202', 'Presidente Juscelino', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2866, '3153301', 'Presidente Kubitschek', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2867, '3153400', 'Presidente Olegário', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2868, '3153509', 'Alto Jequitibá', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2869, '3153608', 'Prudente de Morais', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2870, '3153707', 'Quartel Geral', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2871, '3153806', 'Queluzito', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2872, '3153905', 'Raposos', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2873, '3154002', 'Raul Soares', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2874, '3154101', 'Recreio', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2875, '3154150', 'Reduto', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2876, '3154200', 'Resende Costa', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2877, '3154309', 'Resplendor', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2878, '3154408', 'Ressaquinha', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2879, '3154457', 'Riachinho', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2880, '3154507', 'Riacho dos Machados', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2881, '3154606', 'Ribeirão das Neves', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2882, '3154705', 'Ribeirão Vermelho', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2883, '3154804', 'Rio Acima', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2884, '3154903', 'Rio Casca', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2885, '3155009', 'Rio Doce', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2886, '3155108', 'Rio do Prado', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2887, '3155207', 'Rio Espera', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2888, '3155306', 'Rio Manso', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2889, '3155405', 'Rio Novo', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2890, '3155504', 'Rio Paranaíba', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2891, '3155603', 'Rio Pardo de Minas', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2892, '3155702', 'Rio Piracicaba', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2893, '3155801', 'Rio Pomba', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2894, '3155900', 'Rio Preto', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2895, '3156007', 'Rio Vermelho', 'MG', '2024-06-14 16:39:08', '2024-06-14 16:39:08'),
(2896, '3156106', 'Ritápolis', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2897, '3156205', 'Rochedo de Minas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2898, '3156304', 'Rodeiro', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2899, '3156403', 'Romaria', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2900, '3156452', 'Rosário da Limeira', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2901, '3156502', 'Rubelita', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2902, '3156601', 'Rubim', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2903, '3156700', 'Sabará', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2904, '3156809', 'Sabinópolis', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2905, '3156908', 'Sacramento', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2906, '3157005', 'Salinas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2907, '3157104', 'Salto da Divisa', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2908, '3157203', 'Santa Bárbara', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2909, '3157252', 'Santa Bárbara do Leste', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2910, '3157278', 'Santa Bárbara do Monte Verde', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2911, '3157302', 'Santa Bárbara do Tugúrio', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2912, '3157336', 'Santa Cruz de Minas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2913, '3157377', 'Santa Cruz de Salinas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2914, '3157401', 'Santa Cruz do Escalvado', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2915, '3157500', 'Santa Efigênia de Minas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2916, '3157609', 'Santa Fé de Minas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2917, '3157658', 'Santa Helena de Minas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2918, '3157708', 'Santa Juliana', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2919, '3157807', 'Santa Luzia', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2920, '3157906', 'Santa Margarida', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2921, '3158003', 'Santa Maria de Itabira', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2922, '3158102', 'Santa Maria do Salto', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2923, '3158201', 'Santa Maria do Suaçuí', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2924, '3158300', 'Santana da Vargem', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2925, '3158409', 'Santana de Cataguases', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2926, '3158508', 'Santana de Pirapama', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2927, '3158607', 'Santana do Deserto', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2928, '3158706', 'Santana do Garambéu', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2929, '3158805', 'Santana do Jacaré', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2930, '3158904', 'Santana do Manhuaçu', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2931, '3158953', 'Santana do Paraíso', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2932, '3159001', 'Santana do Riacho', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2933, '3159100', 'Santana dos Montes', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2934, '3159209', 'Santa Rita de Caldas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2935, '3159308', 'Santa Rita de Jacutinga', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2936, '3159357', 'Santa Rita de Minas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2937, '3159407', 'Santa Rita de Ibitipoca', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2938, '3159506', 'Santa Rita do Itueto', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2939, '3159605', 'Santa Rita do Sapucaí', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2940, '3159704', 'Santa Rosa da Serra', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2941, '3159803', 'Santa Vitória', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2942, '3159902', 'Santo Antônio do Amparo', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2943, '3160009', 'Santo Antônio do Aventureiro', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2944, '3160108', 'Santo Antônio do Grama', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2945, '3160207', 'Santo Antônio do Itambé', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2946, '3160306', 'Santo Antônio do Jacinto', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2947, '3160405', 'Santo Antônio do Monte', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2948, '3160454', 'Santo Antônio do Retiro', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2949, '3160504', 'Santo Antônio do Rio Abaixo', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2950, '3160603', 'Santo Hipólito', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2951, '3160702', 'Santos Dumont', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2952, '3160801', 'São Bento Abade', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2953, '3160900', 'São Brás do Suaçuí', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2954, '3160959', 'São Domingos das Dores', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2955, '3161007', 'São Domingos do Prata', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2956, '3161056', 'São Félix de Minas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2957, '3161106', 'São Francisco', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2958, '3161205', 'São Francisco de Paula', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2959, '3161304', 'São Francisco de Sales', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2960, '3161403', 'São Francisco do Glória', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(2961, '3161502', 'São Geraldo', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2962, '3161601', 'São Geraldo da Piedade', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2963, '3161650', 'São Geraldo do Baixio', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2964, '3161700', 'São Gonçalo do Abaeté', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2965, '3161809', 'São Gonçalo do Pará', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2966, '3161908', 'São Gonçalo do Rio Abaixo', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2967, '3162005', 'São Gonçalo do Sapucaí', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2968, '3162104', 'São Gotardo', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2969, '3162203', 'São João Batista do Glória', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2970, '3162252', 'São João da Lagoa', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2971, '3162302', 'São João da Mata', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2972, '3162401', 'São João da Ponte', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2973, '3162450', 'São João das Missões', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2974, '3162500', 'São João del Rei', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2975, '3162559', 'São João do Manhuaçu', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2976, '3162575', 'São João do Manteninha', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2977, '3162609', 'São João do Oriente', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2978, '3162658', 'São João do Pacuí', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2979, '3162708', 'São João do Paraíso', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2980, '3162807', 'São João Evangelista', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2981, '3162906', 'São João Nepomuceno', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2982, '3162922', 'São Joaquim de Bicas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2983, '3162948', 'São José da Barra', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2984, '3162955', 'São José da Lapa', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2985, '3163003', 'São José da Safira', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2986, '3163102', 'São José da Varginha', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2987, '3163201', 'São José do Alegre', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2988, '3163300', 'São José do Divino', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2989, '3163409', 'São José do Goiabal', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2990, '3163508', 'São José do Jacuri', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2991, '3163607', 'São José do Mantimento', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2992, '3163706', 'São Lourenço', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2993, '3163805', 'São Miguel do Anta', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2994, '3163904', 'São Pedro da União', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2995, '3164001', 'São Pedro dos Ferros', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2996, '3164100', 'São Pedro do Suaçuí', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2997, '3164209', 'São Romão', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2998, '3164308', 'São Roque de Minas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(2999, '3164407', 'São Sebastião da Bela Vista', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3000, '3164431', 'São Sebastião da Vargem Alegre', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3001, '3164472', 'São Sebastião do Anta', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3002, '3164506', 'São Sebastião do Maranhão', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3003, '3164605', 'São Sebastião do Oeste', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3004, '3164704', 'São Sebastião do Paraíso', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3005, '3164803', 'São Sebastião do Rio Preto', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3006, '3164902', 'São Sebastião do Rio Verde', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3007, '3165008', 'São Tiago', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3008, '3165107', 'São Tomás de Aquino', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3009, '3165206', 'São Thomé das Letras', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3010, '3165305', 'São Vicente de Minas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3011, '3165404', 'Sapucaí-Mirim', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3012, '3165503', 'Sardoá', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3013, '3165537', 'Sarzedo', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3014, '3165552', 'Setubinha', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3015, '3165560', 'Sem-Peixe', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3016, '3165578', 'Senador Amaral', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3017, '3165602', 'Senador Cortes', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3018, '3165701', 'Senador Firmino', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3019, '3165800', 'Senador José Bento', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3020, '3165909', 'Senador Modestino Gonçalves', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3021, '3166006', 'Senhora de Oliveira', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3022, '3166105', 'Senhora do Porto', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3023, '3166204', 'Senhora dos Remédios', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3024, '3166303', 'Sericita', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3025, '3166402', 'Seritinga', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3026, '3166501', 'Serra Azul de Minas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3027, '3166600', 'Serra da Saudade', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3028, '3166709', 'Serra dos Aimorés', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3029, '3166808', 'Serra do Salitre', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3030, '3166907', 'Serrania', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3031, '3166956', 'Serranópolis de Minas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3032, '3167004', 'Serranos', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3033, '3167103', 'Serro', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3034, '3167202', 'Sete Lagoas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3035, '3167301', 'Silveirânia', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3036, '3167400', 'Silvianópolis', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3037, '3167509', 'Simão Pereira', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3038, '3167608', 'Simonésia', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3039, '3167707', 'Sobrália', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3040, '3167806', 'Soledade de Minas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3041, '3167905', 'Tabuleiro', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3042, '3168002', 'Taiobeiras', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3043, '3168051', 'Taparuba', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3044, '3168101', 'Tapira', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3045, '3168200', 'Tapiraí', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3046, '3168309', 'Taquaraçu de Minas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3047, '3168408', 'Tarumirim', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3048, '3168507', 'Teixeiras', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3049, '3168606', 'Teófilo Otoni', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3050, '3168705', 'Timóteo', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3051, '3168804', 'Tiradentes', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3052, '3168903', 'Tiros', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3053, '3169000', 'Tocantins', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3054, '3169059', 'Tocos do Moji', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3055, '3169109', 'Toledo', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3056, '3169208', 'Tombos', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3057, '3169307', 'Três Corações', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3058, '3169356', 'Três Marias', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3059, '3169406', 'Três Pontas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3060, '3169505', 'Tumiritinga', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3061, '3169604', 'Tupaciguara', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3062, '3169703', 'Turmalina', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3063, '3169802', 'Turvolândia', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3064, '3169901', 'Ubá', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3065, '3170008', 'Ubaí', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3066, '3170057', 'Ubaporanga', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3067, '3170107', 'Uberaba', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3068, '3170206', 'Uberlândia', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3069, '3170305', 'Umburatiba', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3070, '3170404', 'Unaí', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3071, '3170438', 'União de Minas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3072, '3170479', 'Uruana de Minas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3073, '3170503', 'Urucânia', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3074, '3170529', 'Urucuia', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3075, '3170578', 'Vargem Alegre', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3076, '3170602', 'Vargem Bonita', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3077, '3170651', 'Vargem Grande do Rio Pardo', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3078, '3170701', 'Varginha', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3079, '3170750', 'Varjão de Minas', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3080, '3170800', 'Várzea da Palma', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3081, '3170909', 'Varzelândia', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3082, '3171006', 'Vazante', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3083, '3171030', 'Verdelândia', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3084, '3171071', 'Veredinha', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3085, '3171105', 'Veríssimo', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3086, '3171154', 'Vermelho Novo', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3087, '3171204', 'Vespasiano', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3088, '3171303', 'Viçosa', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3089, '3171402', 'Vieiras', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3090, '3171501', 'Mathias Lobato', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3091, '3171600', 'Virgem da Lapa', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3092, '3171709', 'Virgínia', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3093, '3171808', 'Virginópolis', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3094, '3171907', 'Virgolândia', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3095, '3172004', 'Visconde do Rio Branco', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3096, '3172103', 'Volta Grande', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3097, '3172202', 'Wenceslau Braz', 'MG', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3098, '3200102', 'Afonso Cláudio', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3099, '3200136', 'Águia Branca', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3100, '3200169', 'Água Doce do Norte', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3101, '3200201', 'Alegre', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3102, '3200300', 'Alfredo Chaves', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3103, '3200359', 'Alto Rio Novo', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3104, '3200409', 'Anchieta', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3105, '3200508', 'Apiacá', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3106, '3200607', 'Aracruz', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3107, '3200706', 'Atilio Vivacqua', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3108, '3200805', 'Baixo Guandu', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3109, '3200904', 'Barra de São Francisco', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3110, '3201001', 'Boa Esperança', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3111, '3201100', 'Bom Jesus do Norte', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3112, '3201159', 'Brejetuba', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3113, '3201209', 'Cachoeiro de Itapemirim', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3114, '3201308', 'Cariacica', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3115, '3201407', 'Castelo', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3116, '3201506', 'Colatina', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3117, '3201605', 'Conceição da Barra', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3118, '3201704', 'Conceição do Castelo', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3119, '3201803', 'Divino de São Lourenço', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3120, '3201902', 'Domingos Martins', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3121, '3202009', 'Dores do Rio Preto', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3122, '3202108', 'Ecoporanga', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3123, '3202207', 'Fundão', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3124, '3202256', 'Governador Lindenberg', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3125, '3202306', 'Guaçuí', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3126, '3202405', 'Guarapari', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3127, '3202454', 'Ibatiba', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3128, '3202504', 'Ibiraçu', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3129, '3202553', 'Ibitirama', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3130, '3202603', 'Iconha', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3131, '3202652', 'Irupi', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3132, '3202702', 'Itaguaçu', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3133, '3202801', 'Itapemirim', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3134, '3202900', 'Itarana', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3135, '3203007', 'Iúna', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3136, '3203056', 'Jaguaré', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3137, '3203106', 'Jerônimo Monteiro', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3138, '3203130', 'João Neiva', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3139, '3203163', 'Laranja da Terra', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3140, '3203205', 'Linhares', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3141, '3203304', 'Mantenópolis', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3142, '3203320', 'Marataízes', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3143, '3203346', 'Marechal Floriano', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3144, '3203353', 'Marilândia', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3145, '3203403', 'Mimoso do Sul', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3146, '3203502', 'Montanha', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3147, '3203601', 'Mucurici', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3148, '3203700', 'Muniz Freire', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3149, '3203809', 'Muqui', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3150, '3203908', 'Nova Venécia', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3151, '3204005', 'Pancas', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3152, '3204054', 'Pedro Canário', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3153, '3204104', 'Pinheiros', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3154, '3204203', 'Piúma', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3155, '3204252', 'Ponto Belo', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3156, '3204302', 'Presidente Kennedy', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3157, '3204351', 'Rio Bananal', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3158, '3204401', 'Rio Novo do Sul', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3159, '3204500', 'Santa Leopoldina', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3160, '3204559', 'Santa Maria de Jetibá', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3161, '3204609', 'Santa Teresa', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3162, '3204658', 'São Domingos do Norte', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3163, '3204708', 'São Gabriel da Palha', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3164, '3204807', 'São José do Calçado', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3165, '3204906', 'São Mateus', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3166, '3204955', 'São Roque do Canaã', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3167, '3205002', 'Serra', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3168, '3205010', 'Sooretama', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3169, '3205036', 'Vargem Alta', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3170, '3205069', 'Venda Nova do Imigrante', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3171, '3205101', 'Viana', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3172, '3205150', 'Vila Pavão', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3173, '3205176', 'Vila Valério', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3174, '3205200', 'Vila Velha', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3175, '3205309', 'Vitória', 'ES', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3176, '3300100', 'Angra dos Reis', 'RJ', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3177, '3300159', 'Aperibé', 'RJ', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3178, '3300209', 'Araruama', 'RJ', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3179, '3300225', 'Areal', 'RJ', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3180, '3300233', 'Armação dos Búzios', 'RJ', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3181, '3300258', 'Arraial do Cabo', 'RJ', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3182, '3300308', 'Barra do Piraí', 'RJ', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3183, '3300407', 'Barra Mansa', 'RJ', '2024-06-14 16:39:09', '2024-06-14 16:39:09'),
(3184, '3300456', 'Belford Roxo', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3185, '3300506', 'Bom Jardim', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3186, '3300605', 'Bom Jesus do Itabapoana', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3187, '3300704', 'Cabo Frio', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3188, '3300803', 'Cachoeiras de Macacu', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3189, '3300902', 'Cambuci', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3190, '3300936', 'Carapebus', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3191, '3300951', 'Comendador Levy Gasparian', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3192, '3301009', 'Campos dos Goytacazes', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3193, '3301108', 'Cantagalo', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3194, '3301157', 'Cardoso Moreira', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3195, '3301207', 'Carmo', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3196, '3301306', 'Casimiro de Abreu', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3197, '3301405', 'Conceição de Macabu', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3198, '3301504', 'Cordeiro', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3199, '3301603', 'Duas Barras', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3200, '3301702', 'Duque de Caxias', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3201, '3301801', 'Engenheiro Paulo de Frontin', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3202, '3301850', 'Guapimirim', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3203, '3301876', 'Iguaba Grande', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3204, '3301900', 'Itaboraí', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3205, '3302007', 'Itaguaí', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3206, '3302056', 'Italva', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3207, '3302106', 'Itaocara', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3208, '3302205', 'Itaperuna', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3209, '3302254', 'Itatiaia', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3210, '3302270', 'Japeri', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3211, '3302304', 'Laje do Muriaé', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3212, '3302403', 'Macaé', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3213, '3302452', 'Macuco', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3214, '3302502', 'Magé', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3215, '3302601', 'Mangaratiba', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3216, '3302700', 'Maricá', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3217, '3302809', 'Mendes', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3218, '3302858', 'Mesquita', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3219, '3302908', 'Miguel Pereira', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3220, '3303005', 'Miracema', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3221, '3303104', 'Natividade', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3222, '3303203', 'Nilópolis', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3223, '3303302', 'Niterói', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3224, '3303401', 'Nova Friburgo', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3225, '3303500', 'Nova Iguaçu', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3226, '3303609', 'Paracambi', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3227, '3303708', 'Paraíba do Sul', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3228, '3303807', 'Paraty', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3229, '3303856', 'Paty do Alferes', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3230, '3303906', 'Petrópolis', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3231, '3303955', 'Pinheiral', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3232, '3304003', 'Piraí', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3233, '3304102', 'Porciúncula', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3234, '3304110', 'Porto Real', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3235, '3304128', 'Quatis', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3236, '3304144', 'Queimados', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3237, '3304151', 'Quissamã', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3238, '3304201', 'Resende', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3239, '3304300', 'Rio Bonito', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3240, '3304409', 'Rio Claro', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3241, '3304508', 'Rio das Flores', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3242, '3304524', 'Rio das Ostras', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3243, '3304557', 'Rio de Janeiro', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3244, '3304607', 'Santa Maria Madalena', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3245, '3304706', 'Santo Antônio de Pádua', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3246, '3304755', 'São Francisco de Itabapoana', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3247, '3304805', 'São Fidélis', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3248, '3304904', 'São Gonçalo', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3249, '3305000', 'São João da Barra', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3250, '3305109', 'São João de Meriti', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3251, '3305133', 'São José de Ubá', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3252, '3305158', 'São José do Vale do Rio Preto', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3253, '3305208', 'São Pedro da Aldeia', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3254, '3305307', 'São Sebastião do Alto', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3255, '3305406', 'Sapucaia', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3256, '3305505', 'Saquarema', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3257, '3305554', 'Seropédica', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3258, '3305604', 'Silva Jardim', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3259, '3305703', 'Sumidouro', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3260, '3305752', 'Tanguá', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3261, '3305802', 'Teresópolis', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3262, '3305901', 'Trajano de Moraes', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3263, '3306008', 'Três Rios', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3264, '3306107', 'Valença', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3265, '3306156', 'Varre-Sai', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3266, '3306206', 'Vassouras', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3267, '3306305', 'Volta Redonda', 'RJ', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3268, '3500105', 'Adamantina', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3269, '3500204', 'Adolfo', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3270, '3500303', 'Aguaí', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3271, '3500402', 'Águas da Prata', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3272, '3500501', 'Águas de Lindóia', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3273, '3500550', 'Águas de Santa Bárbara', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3274, '3500600', 'Águas de São Pedro', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3275, '3500709', 'Agudos', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3276, '3500758', 'Alambari', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3277, '3500808', 'Alfredo Marcondes', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3278, '3500907', 'Altair', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3279, '3501004', 'Altinópolis', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3280, '3501103', 'Alto Alegre', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3281, '3501152', 'Alumínio', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3282, '3501202', 'Álvares Florence', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3283, '3501301', 'Álvares Machado', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3284, '3501400', 'Álvaro de Carvalho', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3285, '3501509', 'Alvinlândia', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3286, '3501608', 'Americana', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3287, '3501707', 'Américo Brasiliense', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3288, '3501806', 'Américo de Campos', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3289, '3501905', 'Amparo', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3290, '3502002', 'Analândia', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3291, '3502101', 'Andradina', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3292, '3502200', 'Angatuba', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3293, '3502309', 'Anhembi', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3294, '3502408', 'Anhumas', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3295, '3502507', 'Aparecida', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3296, '3502606', 'Aparecida D\'Oeste', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3297, '3502705', 'Apiaí', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3298, '3502754', 'Araçariguama', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3299, '3502804', 'Araçatuba', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3300, '3502903', 'Araçoiaba da Serra', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3301, '3503000', 'Aramina', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3302, '3503109', 'Arandu', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3303, '3503158', 'Arapeí', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3304, '3503208', 'Araraquara', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3305, '3503307', 'Araras', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3306, '3503356', 'Arco-Íris', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3307, '3503406', 'Arealva', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3308, '3503505', 'Areias', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3309, '3503604', 'Areiópolis', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3310, '3503703', 'Ariranha', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3311, '3503802', 'Artur Nogueira', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3312, '3503901', 'Arujá', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3313, '3503950', 'Aspásia', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3314, '3504008', 'Assis', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3315, '3504107', 'Atibaia', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3316, '3504206', 'Auriflama', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3317, '3504305', 'Avaí', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3318, '3504404', 'Avanhandava', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3319, '3504503', 'Avaré', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3320, '3504602', 'Bady Bassitt', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3321, '3504701', 'Balbinos', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3322, '3504800', 'Bálsamo', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3323, '3504909', 'Bananal', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3324, '3505005', 'Barão de Antonina', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3325, '3505104', 'Barbosa', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3326, '3505203', 'Bariri', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3327, '3505302', 'Barra Bonita', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3328, '3505351', 'Barra do Chapéu', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3329, '3505401', 'Barra do Turvo', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3330, '3505500', 'Barretos', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3331, '3505609', 'Barrinha', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3332, '3505708', 'Barueri', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3333, '3505807', 'Bastos', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3334, '3505906', 'Batatais', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3335, '3506003', 'Bauru', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3336, '3506102', 'Bebedouro', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3337, '3506201', 'Bento de Abreu', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3338, '3506300', 'Bernardino de Campos', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3339, '3506359', 'Bertioga', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3340, '3506409', 'Bilac', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3341, '3506508', 'Birigui', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3342, '3506607', 'Biritiba-Mirim', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3343, '3506706', 'Boa Esperança do Sul', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3344, '3506805', 'Bocaina', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3345, '3506904', 'Bofete', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3346, '3507001', 'Boituva', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3347, '3507100', 'Bom Jesus dos Perdões', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3348, '3507159', 'Bom Sucesso de Itararé', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3349, '3507209', 'Borá', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3350, '3507308', 'Boracéia', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3351, '3507407', 'Borborema', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3352, '3507456', 'Borebi', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3353, '3507506', 'Botucatu', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3354, '3507605', 'Bragança Paulista', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3355, '3507704', 'Braúna', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3356, '3507753', 'Brejo Alegre', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3357, '3507803', 'Brodowski', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3358, '3507902', 'Brotas', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3359, '3508009', 'Buri', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3360, '3508108', 'Buritama', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3361, '3508207', 'Buritizal', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3362, '3508306', 'Cabrália Paulista', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3363, '3508405', 'Cabreúva', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3364, '3508504', 'Caçapava', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3365, '3508603', 'Cachoeira Paulista', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3366, '3508702', 'Caconde', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3367, '3508801', 'Cafelândia', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3368, '3508900', 'Caiabu', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3369, '3509007', 'Caieiras', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3370, '3509106', 'Caiuá', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3371, '3509205', 'Cajamar', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3372, '3509254', 'Cajati', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3373, '3509304', 'Cajobi', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3374, '3509403', 'Cajuru', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3375, '3509452', 'Campina do Monte Alegre', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3376, '3509502', 'Campinas', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3377, '3509601', 'Campo Limpo Paulista', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3378, '3509700', 'Campos do Jordão', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3379, '3509809', 'Campos Novos Paulista', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3380, '3509908', 'Cananéia', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3381, '3509957', 'Canas', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3382, '3510005', 'Cândido Mota', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3383, '3510104', 'Cândido Rodrigues', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3384, '3510153', 'Canitar', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3385, '3510203', 'Capão Bonito', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3386, '3510302', 'Capela do Alto', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3387, '3510401', 'Capivari', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3388, '3510500', 'Caraguatatuba', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3389, '3510609', 'Carapicuíba', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3390, '3510708', 'Cardoso', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3391, '3510807', 'Casa Branca', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3392, '3510906', 'Cássia dos Coqueiros', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3393, '3511003', 'Castilho', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3394, '3511102', 'Catanduva', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3395, '3511201', 'Catiguá', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3396, '3511300', 'Cedral', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3397, '3511409', 'Cerqueira César', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3398, '3511508', 'Cerquilho', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3399, '3511607', 'Cesário Lange', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3400, '3511706', 'Charqueada', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3401, '3511904', 'Clementina', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3402, '3512001', 'Colina', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3403, '3512100', 'Colômbia', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3404, '3512209', 'Conchal', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3405, '3512308', 'Conchas', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3406, '3512407', 'Cordeirópolis', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3407, '3512506', 'Coroados', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3408, '3512605', 'Coronel Macedo', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3409, '3512704', 'Corumbataí', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3410, '3512803', 'Cosmópolis', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3411, '3512902', 'Cosmorama', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3412, '3513009', 'Cotia', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3413, '3513108', 'Cravinhos', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3414, '3513207', 'Cristais Paulista', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3415, '3513306', 'Cruzália', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3416, '3513405', 'Cruzeiro', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3417, '3513504', 'Cubatão', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3418, '3513603', 'Cunha', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3419, '3513702', 'Descalvado', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3420, '3513801', 'Diadema', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3421, '3513850', 'Dirce Reis', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3422, '3513900', 'Divinolândia', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3423, '3514007', 'Dobrada', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3424, '3514106', 'Dois Córregos', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3425, '3514205', 'Dolcinópolis', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3426, '3514304', 'Dourado', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3427, '3514403', 'Dracena', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3428, '3514502', 'Duartina', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3429, '3514601', 'Dumont', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3430, '3514700', 'Echaporã', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3431, '3514809', 'Eldorado', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3432, '3514908', 'Elias Fausto', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3433, '3514924', 'Elisiário', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3434, '3514957', 'Embaúba', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3435, '3515004', 'Embu das Artes', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3436, '3515103', 'Embu-Guaçu', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3437, '3515129', 'Emilianópolis', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3438, '3515152', 'Engenheiro Coelho', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3439, '3515186', 'Espírito Santo do Pinhal', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3440, '3515194', 'Espírito Santo do Turvo', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3441, '3515202', 'Estrela D\'Oeste', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3442, '3515301', 'Estrela do Norte', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3443, '3515350', 'Euclides da Cunha Paulista', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3444, '3515400', 'Fartura', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3445, '3515509', 'Fernandópolis', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3446, '3515608', 'Fernando Prestes', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3447, '3515657', 'Fernão', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3448, '3515707', 'Ferraz de Vasconcelos', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3449, '3515806', 'Flora Rica', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3450, '3515905', 'Floreal', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3451, '3516002', 'Flórida Paulista', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3452, '3516101', 'Florínia', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3453, '3516200', 'Franca', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3454, '3516309', 'Francisco Morato', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3455, '3516408', 'Franco da Rocha', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3456, '3516507', 'Gabriel Monteiro', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3457, '3516606', 'Gália', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3458, '3516705', 'Garça', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3459, '3516804', 'Gastão Vidigal', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3460, '3516853', 'Gavião Peixoto', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3461, '3516903', 'General Salgado', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3462, '3517000', 'Getulina', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3463, '3517109', 'Glicério', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3464, '3517208', 'Guaiçara', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3465, '3517307', 'Guaimbê', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3466, '3517406', 'Guaíra', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3467, '3517505', 'Guapiaçu', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3468, '3517604', 'Guapiara', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3469, '3517703', 'Guará', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3470, '3517802', 'Guaraçaí', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3471, '3517901', 'Guaraci', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3472, '3518008', 'Guarani D\'Oeste', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3473, '3518107', 'Guarantã', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3474, '3518206', 'Guararapes', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3475, '3518305', 'Guararema', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3476, '3518404', 'Guaratinguetá', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3477, '3518503', 'Guareí', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3478, '3518602', 'Guariba', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3479, '3518701', 'Guarujá', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3480, '3518800', 'Guarulhos', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3481, '3518859', 'Guatapará', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3482, '3518909', 'Guzolândia', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3483, '3519006', 'Herculândia', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3484, '3519055', 'Holambra', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3485, '3519071', 'Hortolândia', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3486, '3519105', 'Iacanga', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3487, '3519204', 'Iacri', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3488, '3519253', 'Iaras', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3489, '3519303', 'Ibaté', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3490, '3519402', 'Ibirá', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3491, '3519501', 'Ibirarema', 'SP', '2024-06-14 16:39:10', '2024-06-14 16:39:10'),
(3492, '3519600', 'Ibitinga', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3493, '3519709', 'Ibiúna', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3494, '3519808', 'Icém', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3495, '3519907', 'Iepê', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3496, '3520004', 'Igaraçu do Tietê', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3497, '3520103', 'Igarapava', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3498, '3520202', 'Igaratá', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3499, '3520301', 'Iguape', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3500, '3520400', 'Ilhabela', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3501, '3520426', 'Ilha Comprida', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3502, '3520442', 'Ilha Solteira', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3503, '3520509', 'Indaiatuba', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3504, '3520608', 'Indiana', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3505, '3520707', 'Indiaporã', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3506, '3520806', 'Inúbia Paulista', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3507, '3520905', 'Ipaussu', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3508, '3521002', 'Iperó', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3509, '3521101', 'Ipeúna', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3510, '3521150', 'Ipiguá', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3511, '3521200', 'Iporanga', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3512, '3521309', 'Ipuã', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3513, '3521408', 'Iracemápolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3514, '3521507', 'Irapuã', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3515, '3521606', 'Irapuru', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3516, '3521705', 'Itaberá', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3517, '3521804', 'Itaí', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3518, '3521903', 'Itajobi', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3519, '3522000', 'Itaju', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3520, '3522109', 'Itanhaém', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3521, '3522158', 'Itaóca', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3522, '3522208', 'Itapecerica da Serra', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3523, '3522307', 'Itapetininga', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3524, '3522406', 'Itapeva', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3525, '3522505', 'Itapevi', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3526, '3522604', 'Itapira', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3527, '3522653', 'Itapirapuã Paulista', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3528, '3522703', 'Itápolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3529, '3522802', 'Itaporanga', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3530, '3522901', 'Itapuí', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3531, '3523008', 'Itapura', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3532, '3523107', 'Itaquaquecetuba', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3533, '3523206', 'Itararé', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3534, '3523305', 'Itariri', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3535, '3523404', 'Itatiba', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3536, '3523503', 'Itatinga', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3537, '3523602', 'Itirapina', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3538, '3523701', 'Itirapuã', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3539, '3523800', 'Itobi', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3540, '3523909', 'Itu', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3541, '3524006', 'Itupeva', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3542, '3524105', 'Ituverava', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3543, '3524204', 'Jaborandi', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3544, '3524303', 'Jaboticabal', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3545, '3524402', 'Jacareí', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3546, '3524501', 'Jaci', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3547, '3524600', 'Jacupiranga', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3548, '3524709', 'Jaguariúna', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3549, '3524808', 'Jales', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3550, '3524907', 'Jambeiro', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3551, '3525003', 'Jandira', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(3552, '3525102', 'Jardinópolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3553, '3525201', 'Jarinu', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3554, '3525300', 'Jaú', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3555, '3525409', 'Jeriquara', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3556, '3525508', 'Joanópolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3557, '3525607', 'João Ramalho', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3558, '3525706', 'José Bonifácio', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3559, '3525805', 'Júlio Mesquita', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3560, '3525854', 'Jumirim', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3561, '3525904', 'Jundiaí', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3562, '3526001', 'Junqueirópolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3563, '3526100', 'Juquiá', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3564, '3526209', 'Juquitiba', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3565, '3526308', 'Lagoinha', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3566, '3526407', 'Laranjal Paulista', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3567, '3526506', 'Lavínia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3568, '3526605', 'Lavrinhas', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3569, '3526704', 'Leme', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3570, '3526803', 'Lençóis Paulista', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3571, '3526902', 'Limeira', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3572, '3527009', 'Lindóia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3573, '3527108', 'Lins', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3574, '3527207', 'Lorena', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3575, '3527256', 'Lourdes', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3576, '3527306', 'Louveira', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3577, '3527405', 'Lucélia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3578, '3527504', 'Lucianópolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3579, '3527603', 'Luís Antônio', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3580, '3527702', 'Luiziânia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3581, '3527801', 'Lupércio', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3582, '3527900', 'Lutécia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3583, '3528007', 'Macatuba', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3584, '3528106', 'Macaubal', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3585, '3528205', 'Macedônia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3586, '3528304', 'Magda', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3587, '3528403', 'Mairinque', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3588, '3528502', 'Mairiporã', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3589, '3528601', 'Manduri', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3590, '3528700', 'Marabá Paulista', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3591, '3528809', 'Maracaí', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3592, '3528858', 'Marapoama', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3593, '3528908', 'Mariápolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3594, '3529005', 'Marília', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3595, '3529104', 'Marinópolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3596, '3529203', 'Martinópolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3597, '3529302', 'Matão', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3598, '3529401', 'Mauá', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3599, '3529500', 'Mendonça', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3600, '3529609', 'Meridiano', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3601, '3529658', 'Mesópolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3602, '3529708', 'Miguelópolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3603, '3529807', 'Mineiros do Tietê', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3604, '3529906', 'Miracatu', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3605, '3530003', 'Mira Estrela', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3606, '3530102', 'Mirandópolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3607, '3530201', 'Mirante do Paranapanema', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3608, '3530300', 'Mirassol', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3609, '3530409', 'Mirassolândia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3610, '3530508', 'Mococa', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3611, '3530607', 'Mogi das Cruzes', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3612, '3530706', 'Mogi Guaçu', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3613, '3530805', 'Moji Mirim', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3614, '3530904', 'Mombuca', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3615, '3531001', 'Monções', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3616, '3531100', 'Mongaguá', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3617, '3531209', 'Monte Alegre do Sul', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3618, '3531308', 'Monte Alto', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3619, '3531407', 'Monte Aprazível', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3620, '3531506', 'Monte Azul Paulista', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3621, '3531605', 'Monte Castelo', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3622, '3531704', 'Monteiro Lobato', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3623, '3531803', 'Monte Mor', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3624, '3531902', 'Morro Agudo', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3625, '3532009', 'Morungaba', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3626, '3532058', 'Motuca', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3627, '3532108', 'Murutinga do Sul', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3628, '3532157', 'Nantes', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3629, '3532207', 'Narandiba', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3630, '3532306', 'Natividade da Serra', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3631, '3532405', 'Nazaré Paulista', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3632, '3532504', 'Neves Paulista', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3633, '3532603', 'Nhandeara', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3634, '3532702', 'Nipoã', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3635, '3532801', 'Nova Aliança', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3636, '3532827', 'Nova Campina', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3637, '3532843', 'Nova Canaã Paulista', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3638, '3532868', 'Nova Castilho', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3639, '3532900', 'Nova Europa', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3640, '3533007', 'Nova Granada', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3641, '3533106', 'Nova Guataporanga', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3642, '3533205', 'Nova Independência', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3643, '3533254', 'Novais', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3644, '3533304', 'Nova Luzitânia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3645, '3533403', 'Nova Odessa', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3646, '3533502', 'Novo Horizonte', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3647, '3533601', 'Nuporanga', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3648, '3533700', 'Ocauçu', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3649, '3533809', 'Óleo', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3650, '3533908', 'Olímpia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3651, '3534005', 'Onda Verde', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3652, '3534104', 'Oriente', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3653, '3534203', 'Orindiúva', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3654, '3534302', 'Orlândia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3655, '3534401', 'Osasco', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3656, '3534500', 'Oscar Bressane', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3657, '3534609', 'Osvaldo Cruz', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3658, '3534708', 'Ourinhos', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3659, '3534757', 'Ouroeste', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3660, '3534807', 'Ouro Verde', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3661, '3534906', 'Pacaembu', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3662, '3535002', 'Palestina', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3663, '3535101', 'Palmares Paulista', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3664, '3535200', 'Palmeira D\'Oeste', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3665, '3535309', 'Palmital', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3666, '3535408', 'Panorama', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3667, '3535507', 'Paraguaçu Paulista', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3668, '3535606', 'Paraibuna', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3669, '3535705', 'Paraíso', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3670, '3535804', 'Paranapanema', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3671, '3535903', 'Paranapuã', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3672, '3536000', 'Parapuã', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3673, '3536109', 'Pardinho', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3674, '3536208', 'Pariquera-Açu', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3675, '3536257', 'Parisi', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3676, '3536307', 'Patrocínio Paulista', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3677, '3536406', 'Paulicéia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3678, '3536505', 'Paulínia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3679, '3536570', 'Paulistânia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3680, '3536604', 'Paulo de Faria', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3681, '3536703', 'Pederneiras', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3682, '3536802', 'Pedra Bela', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3683, '3536901', 'Pedranópolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3684, '3537008', 'Pedregulho', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3685, '3537107', 'Pedreira', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3686, '3537156', 'Pedrinhas Paulista', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3687, '3537206', 'Pedro de Toledo', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3688, '3537305', 'Penápolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3689, '3537404', 'Pereira Barreto', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3690, '3537503', 'Pereiras', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3691, '3537602', 'Peruíbe', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3692, '3537701', 'Piacatu', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3693, '3537800', 'Piedade', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3694, '3537909', 'Pilar do Sul', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3695, '3538006', 'Pindamonhangaba', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3696, '3538105', 'Pindorama', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3697, '3538204', 'Pinhalzinho', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3698, '3538303', 'Piquerobi', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3699, '3538501', 'Piquete', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3700, '3538600', 'Piracaia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3701, '3538709', 'Piracicaba', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3702, '3538808', 'Piraju', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3703, '3538907', 'Pirajuí', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3704, '3539004', 'Pirangi', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3705, '3539103', 'Pirapora do Bom Jesus', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3706, '3539202', 'Pirapozinho', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3707, '3539301', 'Pirassununga', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3708, '3539400', 'Piratininga', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3709, '3539509', 'Pitangueiras', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3710, '3539608', 'Planalto', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3711, '3539707', 'Platina', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3712, '3539806', 'Poá', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3713, '3539905', 'Poloni', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3714, '3540002', 'Pompéia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3715, '3540101', 'Pongaí', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3716, '3540200', 'Pontal', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3717, '3540259', 'Pontalinda', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3718, '3540309', 'Pontes Gestal', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3719, '3540408', 'Populina', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3720, '3540507', 'Porangaba', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3721, '3540606', 'Porto Feliz', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3722, '3540705', 'Porto Ferreira', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3723, '3540754', 'Potim', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3724, '3540804', 'Potirendaba', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3725, '3540853', 'Pracinha', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3726, '3540903', 'Pradópolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3727, '3541000', 'Praia Grande', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3728, '3541059', 'Pratânia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3729, '3541109', 'Presidente Alves', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3730, '3541208', 'Presidente Bernardes', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3731, '3541307', 'Presidente Epitácio', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3732, '3541406', 'Presidente Prudente', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3733, '3541505', 'Presidente Venceslau', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3734, '3541604', 'Promissão', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3735, '3541653', 'Quadra', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3736, '3541703', 'Quatá', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3737, '3541802', 'Queiroz', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3738, '3541901', 'Queluz', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3739, '3542008', 'Quintana', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3740, '3542107', 'Rafard', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3741, '3542206', 'Rancharia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3742, '3542305', 'Redenção da Serra', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3743, '3542404', 'Regente Feijó', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3744, '3542503', 'Reginópolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3745, '3542602', 'Registro', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3746, '3542701', 'Restinga', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3747, '3542800', 'Ribeira', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3748, '3542909', 'Ribeirão Bonito', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3749, '3543006', 'Ribeirão Branco', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3750, '3543105', 'Ribeirão Corrente', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3751, '3543204', 'Ribeirão do Sul', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3752, '3543238', 'Ribeirão dos Índios', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3753, '3543253', 'Ribeirão Grande', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3754, '3543303', 'Ribeirão Pires', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3755, '3543402', 'Ribeirão Preto', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3756, '3543501', 'Riversul', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3757, '3543600', 'Rifaina', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3758, '3543709', 'Rincão', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3759, '3543808', 'Rinópolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3760, '3543907', 'Rio Claro', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3761, '3544004', 'Rio das Pedras', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3762, '3544103', 'Rio Grande da Serra', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3763, '3544202', 'Riolândia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3764, '3544251', 'Rosana', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3765, '3544301', 'Roseira', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3766, '3544400', 'Rubiácea', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3767, '3544509', 'Rubinéia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3768, '3544608', 'Sabino', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3769, '3544707', 'Sagres', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3770, '3544806', 'Sales', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3771, '3544905', 'Sales Oliveira', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3772, '3545001', 'Salesópolis', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3773, '3545100', 'Salmourão', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3774, '3545159', 'Saltinho', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3775, '3545209', 'Salto', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3776, '3545308', 'Salto de Pirapora', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3777, '3545407', 'Salto Grande', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3778, '3545506', 'Sandovalina', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3779, '3545605', 'Santa Adélia', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3780, '3545704', 'Santa Albertina', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3781, '3545803', 'Santa Bárbara D\'Oeste', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3782, '3546009', 'Santa Branca', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3783, '3546108', 'Santa Clara D\'Oeste', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3784, '3546207', 'Santa Cruz da Conceição', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3785, '3546256', 'Santa Cruz da Esperança', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3786, '3546306', 'Santa Cruz das Palmeiras', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3787, '3546405', 'Santa Cruz do Rio Pardo', 'SP', '2024-06-14 16:39:11', '2024-06-14 16:39:11'),
(3788, '3546504', 'Santa Ernestina', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3789, '3546603', 'Santa Fé do Sul', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3790, '3546702', 'Santa Gertrudes', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3791, '3546801', 'Santa Isabel', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3792, '3546900', 'Santa Lúcia', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3793, '3547007', 'Santa Maria da Serra', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3794, '3547106', 'Santa Mercedes', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3795, '3547205', 'Santana da Ponte Pensa', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3796, '3547304', 'Santana de Parnaíba', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3797, '3547403', 'Santa Rita D\'Oeste', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3798, '3547502', 'Santa Rita do Passa Quatro', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3799, '3547601', 'Santa Rosa de Viterbo', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3800, '3547650', 'Santa Salete', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3801, '3547700', 'Santo Anastácio', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3802, '3547809', 'Santo André', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3803, '3547908', 'Santo Antônio da Alegria', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3804, '3548005', 'Santo Antônio de Posse', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3805, '3548054', 'Santo Antônio do Aracanguá', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3806, '3548104', 'Santo Antônio do Jardim', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3807, '3548203', 'Santo Antônio do Pinhal', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3808, '3548302', 'Santo Expedito', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3809, '3548401', 'Santópolis do Aguapeí', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3810, '3548500', 'Santos', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3811, '3548609', 'São Bento do Sapucaí', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3812, '3548708', 'São Bernardo do Campo', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3813, '3548807', 'São Caetano do Sul', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3814, '3548906', 'São Carlos', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3815, '3549003', 'São Francisco', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3816, '3549102', 'São João da Boa Vista', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3817, '3549201', 'São João das Duas Pontes', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3818, '3549250', 'São João de Iracema', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3819, '3549300', 'São João do Pau D\'Alho', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3820, '3549409', 'São Joaquim da Barra', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3821, '3549508', 'São José da Bela Vista', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3822, '3549607', 'São José do Barreiro', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3823, '3549706', 'São José do Rio Pardo', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3824, '3549805', 'São José do Rio Preto', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3825, '3549904', 'São José dos Campos', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3826, '3549953', 'São Lourenço da Serra', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3827, '3550001', 'São Luís do Paraitinga', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3828, '3550100', 'São Manuel', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3829, '3550209', 'São Miguel Arcanjo', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3830, '3550308', 'São Paulo', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3831, '3550407', 'São Pedro', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3832, '3550506', 'São Pedro do Turvo', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3833, '3550605', 'São Roque', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3834, '3550704', 'São Sebastião', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3835, '3550803', 'São Sebastião da Grama', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3836, '3550902', 'São Simão', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3837, '3551009', 'São Vicente', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3838, '3551108', 'Sarapuí', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3839, '3551207', 'Sarutaiá', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3840, '3551306', 'Sebastianópolis do Sul', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3841, '3551405', 'Serra Azul', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3842, '3551504', 'Serrana', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3843, '3551603', 'Serra Negra', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3844, '3551702', 'Sertãozinho', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3845, '3551801', 'Sete Barras', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3846, '3551900', 'Severínia', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3847, '3552007', 'Silveiras', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3848, '3552106', 'Socorro', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3849, '3552205', 'Sorocaba', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3850, '3552304', 'Sud Mennucci', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3851, '3552403', 'Sumaré', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3852, '3552502', 'Suzano', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3853, '3552551', 'Suzanápolis', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3854, '3552601', 'Tabapuã', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3855, '3552700', 'Tabatinga', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3856, '3552809', 'Taboão da Serra', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3857, '3552908', 'Taciba', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3858, '3553005', 'Taguaí', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3859, '3553104', 'Taiaçu', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3860, '3553203', 'Taiúva', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3861, '3553302', 'Tambaú', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3862, '3553401', 'Tanabi', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3863, '3553500', 'Tapiraí', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3864, '3553609', 'Tapiratiba', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3865, '3553658', 'Taquaral', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3866, '3553708', 'Taquaritinga', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3867, '3553807', 'Taquarituba', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3868, '3553856', 'Taquarivaí', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3869, '3553906', 'Tarabai', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3870, '3553955', 'Tarumã', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3871, '3554003', 'Tatuí', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3872, '3554102', 'Taubaté', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3873, '3554201', 'Tejupá', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3874, '3554300', 'Teodoro Sampaio', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3875, '3554409', 'Terra Roxa', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3876, '3554508', 'Tietê', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3877, '3554607', 'Timburi', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3878, '3554656', 'Torre de Pedra', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3879, '3554706', 'Torrinha', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3880, '3554755', 'Trabiju', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3881, '3554805', 'Tremembé', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3882, '3554904', 'Três Fronteiras', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3883, '3554953', 'Tuiuti', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3884, '3555000', 'Tupã', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3885, '3555109', 'Tupi Paulista', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3886, '3555208', 'Turiúba', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3887, '3555307', 'Turmalina', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3888, '3555356', 'Ubarana', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3889, '3555406', 'Ubatuba', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3890, '3555505', 'Ubirajara', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3891, '3555604', 'Uchoa', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3892, '3555703', 'União Paulista', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3893, '3555802', 'Urânia', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3894, '3555901', 'Uru', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3895, '3556008', 'Urupês', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3896, '3556107', 'Valentim Gentil', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3897, '3556206', 'Valinhos', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3898, '3556305', 'Valparaíso', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3899, '3556354', 'Vargem', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3900, '3556404', 'Vargem Grande do Sul', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3901, '3556453', 'Vargem Grande Paulista', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3902, '3556503', 'Várzea Paulista', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3903, '3556602', 'Vera Cruz', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3904, '3556701', 'Vinhedo', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3905, '3556800', 'Viradouro', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3906, '3556909', 'Vista Alegre do Alto', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3907, '3556958', 'Vitória Brasil', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3908, '3557006', 'Votorantim', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3909, '3557105', 'Votuporanga', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3910, '3557154', 'Zacarias', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3911, '3557204', 'Chavantes', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3912, '3557303', 'Estiva Gerbi', 'SP', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3913, '4100103', 'Abatiá', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3914, '4100202', 'Adrianópolis', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3915, '4100301', 'Agudos do Sul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3916, '4100400', 'Almirante Tamandaré', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3917, '4100459', 'Altamira do Paraná', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3918, '4100509', 'Altônia', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3919, '4100608', 'Alto Paraná', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3920, '4100707', 'Alto Piquiri', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3921, '4100806', 'Alvorada do Sul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3922, '4100905', 'Amaporã', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3923, '4101002', 'Ampére', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3924, '4101051', 'Anahy', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3925, '4101101', 'Andirá', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3926, '4101150', 'Ângulo', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3927, '4101200', 'Antonina', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3928, '4101309', 'Antônio Olinto', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3929, '4101408', 'Apucarana', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3930, '4101507', 'Arapongas', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3931, '4101606', 'Arapoti', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3932, '4101655', 'Arapuã', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3933, '4101705', 'Araruna', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3934, '4101804', 'Araucária', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3935, '4101853', 'Ariranha do Ivaí', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3936, '4101903', 'Assaí', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3937, '4102000', 'Assis Chateaubriand', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3938, '4102109', 'Astorga', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3939, '4102208', 'Atalaia', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3940, '4102307', 'Balsa Nova', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3941, '4102406', 'Bandeirantes', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3942, '4102505', 'Barbosa Ferraz', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3943, '4102604', 'Barracão', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3944, '4102703', 'Barra do Jacaré', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3945, '4102752', 'Bela Vista da Caroba', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3946, '4102802', 'Bela Vista do Paraíso', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3947, '4102901', 'Bituruna', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3948, '4103008', 'Boa Esperança', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3949, '4103024', 'Boa Esperança do Iguaçu', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3950, '4103040', 'Boa Ventura de São Roque', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3951, '4103057', 'Boa Vista da Aparecida', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3952, '4103107', 'Bocaiúva do Sul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3953, '4103156', 'Bom Jesus do Sul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3954, '4103206', 'Bom Sucesso', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3955, '4103222', 'Bom Sucesso do Sul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3956, '4103305', 'Borrazópolis', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3957, '4103354', 'Braganey', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3958, '4103370', 'Brasilândia do Sul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3959, '4103404', 'Cafeara', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3960, '4103453', 'Cafelândia', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3961, '4103479', 'Cafezal do Sul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3962, '4103503', 'Califórnia', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3963, '4103602', 'Cambará', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3964, '4103701', 'Cambé', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3965, '4103800', 'Cambira', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3966, '4103909', 'Campina da Lagoa', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3967, '4103958', 'Campina do Simão', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3968, '4104006', 'Campina Grande do Sul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3969, '4104055', 'Campo Bonito', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3970, '4104105', 'Campo do Tenente', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3971, '4104204', 'Campo Largo', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3972, '4104253', 'Campo Magro', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3973, '4104303', 'Campo Mourão', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3974, '4104402', 'Cândido de Abreu', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3975, '4104428', 'Candói', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3976, '4104451', 'Cantagalo', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3977, '4104501', 'Capanema', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3978, '4104600', 'Capitão Leônidas Marques', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3979, '4104659', 'Carambeí', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3980, '4104709', 'Carlópolis', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3981, '4104808', 'Cascavel', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3982, '4104907', 'Castro', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3983, '4105003', 'Catanduvas', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3984, '4105102', 'Centenário do Sul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3985, '4105201', 'Cerro Azul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3986, '4105300', 'Céu Azul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3987, '4105409', 'Chopinzinho', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3988, '4105508', 'Cianorte', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3989, '4105607', 'cidades Gaúcha', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3990, '4105706', 'Clevelândia', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3991, '4105805', 'Colombo', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3992, '4105904', 'Colorado', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3993, '4106001', 'Congonhinhas', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3994, '4106100', 'Conselheiro Mairinck', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3995, '4106209', 'Contenda', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3996, '4106308', 'Corbélia', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3997, '4106407', 'Cornélio Procópio', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3998, '4106456', 'Coronel Domingos Soares', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(3999, '4106506', 'Coronel Vivida', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4000, '4106555', 'Corumbataí do Sul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4001, '4106571', 'Cruzeiro do Iguaçu', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4002, '4106605', 'Cruzeiro do Oeste', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4003, '4106704', 'Cruzeiro do Sul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4004, '4106803', 'Cruz Machado', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4005, '4106852', 'Cruzmaltina', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4006, '4106902', 'Curitiba', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4007, '4107009', 'Curiúva', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4008, '4107108', 'Diamante do Norte', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4009, '4107124', 'Diamante do Sul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4010, '4107157', 'Diamante D\'Oeste', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4011, '4107207', 'Dois Vizinhos', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4012, '4107256', 'Douradina', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4013, '4107306', 'Doutor Camargo', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4014, '4107405', 'Enéas Marques', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4015, '4107504', 'Engenheiro Beltrão', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4016, '4107520', 'Esperança Nova', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4017, '4107538', 'Entre Rios do Oeste', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4018, '4107546', 'Espigão Alto do Iguaçu', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4019, '4107553', 'Farol', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4020, '4107603', 'Faxinal', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4021, '4107652', 'Fazenda Rio Grande', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4022, '4107702', 'Fênix', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4023, '4107736', 'Fernandes Pinheiro', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4024, '4107751', 'Figueira', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4025, '4107801', 'Floraí', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4026, '4107850', 'Flor da Serra do Sul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4027, '4107900', 'Floresta', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4028, '4108007', 'Florestópolis', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4029, '4108106', 'Flórida', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4030, '4108205', 'Formosa do Oeste', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4031, '4108304', 'Foz do Iguaçu', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4032, '4108320', 'Francisco Alves', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4033, '4108403', 'Francisco Beltrão', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4034, '4108452', 'Foz do Jordão', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4035, '4108502', 'General Carneiro', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4036, '4108551', 'Godoy Moreira', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4037, '4108601', 'Goioerê', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4038, '4108650', 'Goioxim', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4039, '4108700', 'Grandes Rios', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4040, '4108809', 'Guaíra', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4041, '4108908', 'Guairaçá', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4042, '4108957', 'Guamiranga', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4043, '4109005', 'Guapirama', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4044, '4109104', 'Guaporema', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4045, '4109203', 'Guaraci', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4046, '4109302', 'Guaraniaçu', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4047, '4109401', 'Guarapuava', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4048, '4109500', 'Guaraqueçaba', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4049, '4109609', 'Guaratuba', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4050, '4109658', 'Honório Serpa', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4051, '4109708', 'Ibaiti', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4052, '4109757', 'Ibema', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4053, '4109807', 'Ibiporã', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4054, '4109906', 'Icaraíma', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4055, '4110003', 'Iguaraçu', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4056, '4110052', 'Iguatu', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4057, '4110078', 'Imbaú', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4058, '4110102', 'Imbituva', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4059, '4110201', 'Inácio Martins', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4060, '4110300', 'Inajá', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4061, '4110409', 'Indianópolis', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4062, '4110508', 'Ipiranga', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4063, '4110607', 'Iporã', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4064, '4110656', 'Iracema do Oeste', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4065, '4110706', 'Irati', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4066, '4110805', 'Iretama', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4067, '4110904', 'Itaguajé', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4068, '4110953', 'Itaipulândia', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4069, '4111001', 'Itambaracá', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4070, '4111100', 'Itambé', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4071, '4111209', 'Itapejara D\'Oeste', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4072, '4111258', 'Itaperuçu', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4073, '4111308', 'Itaúna do Sul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4074, '4111407', 'Ivaí', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4075, '4111506', 'Ivaiporã', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4076, '4111555', 'Ivaté', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4077, '4111605', 'Ivatuba', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4078, '4111704', 'Jaboti', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4079, '4111803', 'Jacarezinho', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4080, '4111902', 'Jaguapitã', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4081, '4112009', 'Jaguariaíva', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4082, '4112108', 'Jandaia do Sul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4083, '4112207', 'Janiópolis', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4084, '4112306', 'Japira', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4085, '4112405', 'Japurá', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4086, '4112504', 'Jardim Alegre', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4087, '4112603', 'Jardim Olinda', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4088, '4112702', 'Jataizinho', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4089, '4112751', 'Jesuítas', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4090, '4112801', 'Joaquim Távora', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4091, '4112900', 'Jundiaí do Sul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4092, '4112959', 'Juranda', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4093, '4113007', 'Jussara', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4094, '4113106', 'Kaloré', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4095, '4113205', 'Lapa', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4096, '4113254', 'Laranjal', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4097, '4113304', 'Laranjeiras do Sul', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4098, '4113403', 'Leópolis', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4099, '4113429', 'Lidianópolis', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4100, '4113452', 'Lindoeste', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4101, '4113502', 'Loanda', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4102, '4113601', 'Lobato', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4103, '4113700', 'Londrina', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4104, '4113734', 'Luiziana', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4105, '4113759', 'Lunardelli', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4106, '4113809', 'Lupionópolis', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4107, '4113908', 'Mallet', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4108, '4114005', 'Mamborê', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4109, '4114104', 'Mandaguaçu', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4110, '4114203', 'Mandaguari', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4111, '4114302', 'Mandirituba', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4112, '4114351', 'Manfrinópolis', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4113, '4114401', 'Mangueirinha', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4114, '4114500', 'Manoel Ribas', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4115, '4114609', 'Marechal Cândido Rondon', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4116, '4114708', 'Maria Helena', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4117, '4114807', 'Marialva', 'PR', '2024-06-14 16:39:12', '2024-06-14 16:39:12'),
(4118, '4114906', 'Marilândia do Sul', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4119, '4115002', 'Marilena', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4120, '4115101', 'Mariluz', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4121, '4115200', 'Maringá', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4122, '4115309', 'Mariópolis', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4123, '4115358', 'Maripá', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4124, '4115408', 'Marmeleiro', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4125, '4115457', 'Marquinho', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4126, '4115507', 'Marumbi', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4127, '4115606', 'Matelândia', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4128, '4115705', 'Matinhos', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4129, '4115739', 'Mato Rico', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4130, '4115754', 'Mauá da Serra', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4131, '4115804', 'Medianeira', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4132, '4115853', 'Mercedes', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4133, '4115903', 'Mirador', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4134, '4116000', 'Miraselva', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4135, '4116059', 'Missal', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4136, '4116109', 'Moreira Sales', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4137, '4116208', 'Morretes', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4138, '4116307', 'Munhoz de Melo', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4139, '4116406', 'Nossa Senhora das Graças', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4140, '4116505', 'Nova Aliança do Ivaí', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4141, '4116604', 'Nova América da Colina', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4142, '4116703', 'Nova Aurora', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4143, '4116802', 'Nova Cantu', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(4144, '4116901', 'Nova Esperança', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4145, '4116950', 'Nova Esperança do Sudoeste', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4146, '4117008', 'Nova Fátima', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4147, '4117057', 'Nova Laranjeiras', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4148, '4117107', 'Nova Londrina', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4149, '4117206', 'Nova Olímpia', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4150, '4117214', 'Nova Santa Bárbara', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4151, '4117222', 'Nova Santa Rosa', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4152, '4117255', 'Nova Prata do Iguaçu', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4153, '4117271', 'Nova Tebas', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4154, '4117297', 'Novo Itacolomi', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4155, '4117305', 'Ortigueira', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4156, '4117404', 'Ourizona', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4157, '4117453', 'Ouro Verde do Oeste', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4158, '4117503', 'Paiçandu', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4159, '4117602', 'Palmas', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4160, '4117701', 'Palmeira', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4161, '4117800', 'Palmital', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4162, '4117909', 'Palotina', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4163, '4118006', 'Paraíso do Norte', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4164, '4118105', 'Paranacity', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4165, '4118204', 'Paranaguá', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4166, '4118303', 'Paranapoema', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4167, '4118402', 'Paranavaí', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4168, '4118451', 'Pato Bragado', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4169, '4118501', 'Pato Branco', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4170, '4118600', 'Paula Freitas', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4171, '4118709', 'Paulo Frontin', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4172, '4118808', 'Peabiru', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4173, '4118857', 'Perobal', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4174, '4118907', 'Pérola', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4175, '4119004', 'Pérola D\'Oeste', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4176, '4119103', 'Piên', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4177, '4119152', 'Pinhais', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4178, '4119202', 'Pinhalão', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4179, '4119251', 'Pinhal de São Bento', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4180, '4119301', 'Pinhão', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4181, '4119400', 'Piraí do Sul', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4182, '4119509', 'Piraquara', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4183, '4119608', 'Pitanga', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4184, '4119657', 'Pitangueiras', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4185, '4119707', 'Planaltina do Paraná', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4186, '4119806', 'Planalto', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4187, '4119905', 'Ponta Grossa', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4188, '4119954', 'Pontal do Paraná', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4189, '4120002', 'Porecatu', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4190, '4120101', 'Porto Amazonas', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4191, '4120150', 'Porto Barreiro', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4192, '4120200', 'Porto Rico', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4193, '4120309', 'Porto Vitória', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4194, '4120333', 'Prado Ferreira', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4195, '4120358', 'Pranchita', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4196, '4120408', 'Presidente Castelo Branco', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4197, '4120507', 'Primeiro de Maio', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4198, '4120606', 'Prudentópolis', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4199, '4120655', 'Quarto Centenário', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4200, '4120705', 'Quatiguá', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4201, '4120804', 'Quatro Barras', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4202, '4120853', 'Quatro Pontes', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4203, '4120903', 'Quedas do Iguaçu', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4204, '4121000', 'Querência do Norte', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4205, '4121109', 'Quinta do Sol', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4206, '4121208', 'Quitandinha', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4207, '4121257', 'Ramilândia', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4208, '4121307', 'Rancho Alegre', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4209, '4121356', 'Rancho Alegre D\'Oeste', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4210, '4121406', 'Realeza', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4211, '4121505', 'Rebouças', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4212, '4121604', 'Renascença', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4213, '4121703', 'Reserva', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4214, '4121752', 'Reserva do Iguaçu', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4215, '4121802', 'Ribeirão Claro', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4216, '4121901', 'Ribeirão do Pinhal', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4217, '4122008', 'Rio Azul', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4218, '4122107', 'Rio Bom', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4219, '4122156', 'Rio Bonito do Iguaçu', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4220, '4122172', 'Rio Branco do Ivaí', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4221, '4122206', 'Rio Branco do Sul', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4222, '4122305', 'Rio Negro', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4223, '4122404', 'Rolândia', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4224, '4122503', 'Roncador', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4225, '4122602', 'Rondon', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4226, '4122651', 'Rosário do Ivaí', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4227, '4122701', 'Sabáudia', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4228, '4122800', 'Salgado Filho', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4229, '4122909', 'Salto do Itararé', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4230, '4123006', 'Salto do Lontra', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4231, '4123105', 'Santa Amélia', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4232, '4123204', 'Santa Cecília do Pavão', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4233, '4123303', 'Santa Cruz de Monte Castelo', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4234, '4123402', 'Santa Fé', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4235, '4123501', 'Santa Helena', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4236, '4123600', 'Santa Inês', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4237, '4123709', 'Santa Isabel do Ivaí', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4238, '4123808', 'Santa Izabel do Oeste', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4239, '4123824', 'Santa Lúcia', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4240, '4123857', 'Santa Maria do Oeste', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4241, '4123907', 'Santa Mariana', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4242, '4123956', 'Santa Mônica', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4243, '4124004', 'Santana do Itararé', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4244, '4124020', 'Santa Tereza do Oeste', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4245, '4124053', 'Santa Terezinha de Itaipu', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4246, '4124103', 'Santo Antônio da Platina', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4247, '4124202', 'Santo Antônio do Caiuá', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4248, '4124301', 'Santo Antônio do Paraíso', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4249, '4124400', 'Santo Antônio do Sudoeste', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4250, '4124509', 'Santo Inácio', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4251, '4124608', 'São Carlos do Ivaí', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4252, '4124707', 'São Jerônimo da Serra', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4253, '4124806', 'São João', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4254, '4124905', 'São João do Caiuá', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4255, '4125001', 'São João do Ivaí', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4256, '4125100', 'São João do Triunfo', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4257, '4125209', 'São Jorge D\'Oeste', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4258, '4125308', 'São Jorge do Ivaí', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4259, '4125357', 'São Jorge do Patrocínio', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4260, '4125407', 'São José da Boa Vista', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4261, '4125456', 'São José das Palmeiras', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4262, '4125506', 'São José dos Pinhais', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4263, '4125555', 'São Manoel do Paraná', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4264, '4125605', 'São Mateus do Sul', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4265, '4125704', 'São Miguel do Iguaçu', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4266, '4125753', 'São Pedro do Iguaçu', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4267, '4125803', 'São Pedro do Ivaí', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4268, '4125902', 'São Pedro do Paraná', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4269, '4126009', 'São Sebastião da Amoreira', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4270, '4126108', 'São Tomé', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4271, '4126207', 'Sapopema', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4272, '4126256', 'Sarandi', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4273, '4126272', 'Saudade do Iguaçu', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4274, '4126306', 'Sengés', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4275, '4126355', 'Serranópolis do Iguaçu', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4276, '4126405', 'Sertaneja', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4277, '4126504', 'Sertanópolis', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4278, '4126603', 'Siqueira Campos', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4279, '4126652', 'Sulina', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4280, '4126678', 'Tamarana', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4281, '4126702', 'Tamboara', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4282, '4126801', 'Tapejara', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4283, '4126900', 'Tapira', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4284, '4127007', 'Teixeira Soares', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4285, '4127106', 'Telêmaco Borba', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4286, '4127205', 'Terra Boa', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4287, '4127304', 'Terra Rica', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4288, '4127403', 'Terra Roxa', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4289, '4127502', 'Tibagi', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4290, '4127601', 'Tijucas do Sul', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4291, '4127700', 'Toledo', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4292, '4127809', 'Tomazina', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4293, '4127858', 'Três Barras do Paraná', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4294, '4127882', 'Tunas do Paraná', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4295, '4127908', 'Tuneiras do Oeste', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4296, '4127957', 'Tupãssi', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4297, '4127965', 'Turvo', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4298, '4128005', 'Ubiratã', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4299, '4128104', 'Umuarama', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4300, '4128203', 'União da Vitória', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4301, '4128302', 'Uniflor', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4302, '4128401', 'Uraí', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4303, '4128500', 'Wenceslau Braz', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4304, '4128534', 'Ventania', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4305, '4128559', 'Vera Cruz do Oeste', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4306, '4128609', 'Verê', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4307, '4128625', 'Alto Paraíso', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4308, '4128633', 'Doutor Ulysses', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4309, '4128658', 'Virmond', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4310, '4128708', 'Vitorino', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4311, '4128807', 'Xambrê', 'PR', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4312, '4200051', 'Abdon Batista', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4313, '4200101', 'Abelardo Luz', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4314, '4200200', 'Agrolândia', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4315, '4200309', 'Agronômica', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4316, '4200408', 'Água Doce', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4317, '4200507', 'Águas de Chapecó', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4318, '4200556', 'Águas Frias', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4319, '4200606', 'Águas Mornas', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4320, '4200705', 'Alfredo Wagner', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4321, '4200754', 'Alto Bela Vista', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4322, '4200804', 'Anchieta', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4323, '4200903', 'Angelina', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4324, '4201000', 'Anita Garibaldi', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4325, '4201109', 'Anitápolis', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4326, '4201208', 'Antônio Carlos', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4327, '4201257', 'Apiúna', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4328, '4201273', 'Arabutã', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4329, '4201307', 'Araquari', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4330, '4201406', 'Araranguá', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4331, '4201505', 'Armazém', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4332, '4201604', 'Arroio Trinta', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4333, '4201653', 'Arvoredo', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4334, '4201703', 'Ascurra', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4335, '4201802', 'Atalanta', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4336, '4201901', 'Aurora', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4337, '4201950', 'Balneário Arroio do Silva', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4338, '4202008', 'Balneário Camboriú', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4339, '4202057', 'Balneário Barra do Sul', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4340, '4202073', 'Balneário Gaivota', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4341, '4202081', 'Bandeirante', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4342, '4202099', 'Barra Bonita', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4343, '4202107', 'Barra Velha', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4344, '4202131', 'Bela Vista do Toldo', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4345, '4202156', 'Belmonte', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4346, '4202206', 'Benedito Novo', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4347, '4202305', 'Biguaçu', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4348, '4202404', 'Blumenau', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4349, '4202438', 'Bocaina do Sul', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4350, '4202453', 'Bombinhas', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4351, '4202503', 'Bom Jardim da Serra', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4352, '4202537', 'Bom Jesus', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4353, '4202578', 'Bom Jesus do Oeste', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4354, '4202602', 'Bom Retiro', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4355, '4202701', 'Botuverá', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4356, '4202800', 'Braço do Norte', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4357, '4202859', 'Braço do Trombudo', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4358, '4202875', 'Brunópolis', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4359, '4202909', 'Brusque', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4360, '4203006', 'Caçador', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4361, '4203105', 'Caibi', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4362, '4203154', 'Calmon', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4363, '4203204', 'Camboriú', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4364, '4203253', 'Capão Alto', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4365, '4203303', 'Campo Alegre', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4366, '4203402', 'Campo Belo do Sul', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4367, '4203501', 'Campo Erê', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4368, '4203600', 'Campos Novos', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4369, '4203709', 'Canelinha', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4370, '4203808', 'Canoinhas', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4371, '4203907', 'Capinzal', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4372, '4203956', 'Capivari de Baixo', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4373, '4204004', 'Catanduvas', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4374, '4204103', 'Caxambu do Sul', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4375, '4204152', 'Celso Ramos', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4376, '4204178', 'Cerro Negro', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4377, '4204194', 'Chapadão do Lageado', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4378, '4204202', 'Chapecó', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4379, '4204251', 'Cocal do Sul', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4380, '4204301', 'Concórdia', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4381, '4204350', 'Cordilheira Alta', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4382, '4204400', 'Coronel Freitas', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4383, '4204459', 'Coronel Martins', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4384, '4204509', 'Corupá', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4385, '4204558', 'Correia Pinto', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4386, '4204608', 'Criciúma', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4387, '4204707', 'Cunha Porã', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4388, '4204756', 'Cunhataí', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4389, '4204806', 'Curitibanos', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4390, '4204905', 'Descanso', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4391, '4205001', 'Dionísio Cerqueira', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4392, '4205100', 'Dona Emma', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4393, '4205159', 'Doutor Pedrinho', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4394, '4205175', 'Entre Rios', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4395, '4205191', 'Ermo', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4396, '4205209', 'Erval Velho', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4397, '4205308', 'Faxinal dos Guedes', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4398, '4205357', 'Flor do Sertão', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4399, '4205407', 'Florianópolis', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4400, '4205431', 'Formosa do Sul', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4401, '4205456', 'Forquilhinha', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4402, '4205506', 'Fraiburgo', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4403, '4205555', 'Frei Rogério', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4404, '4205605', 'Galvão', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4405, '4205704', 'Garopaba', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4406, '4205803', 'Garuva', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4407, '4205902', 'Gaspar', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4408, '4206009', 'Governador Celso Ramos', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4409, '4206108', 'Grão Pará', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4410, '4206207', 'Gravatal', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4411, '4206306', 'Guabiruba', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4412, '4206405', 'Guaraciaba', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4413, '4206504', 'Guaramirim', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4414, '4206603', 'Guarujá do Sul', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4415, '4206652', 'Guatambú', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4416, '4206702', 'Herval D\'Oeste', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4417, '4206751', 'Ibiam', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4418, '4206801', 'Ibicaré', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4419, '4206900', 'Ibirama', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4420, '4207007', 'Içara', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4421, '4207106', 'Ilhota', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4422, '4207205', 'Imaruí', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4423, '4207304', 'Imbituba', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4424, '4207403', 'Imbuia', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4425, '4207502', 'Indaial', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4426, '4207577', 'Iomerê', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4427, '4207601', 'Ipira', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4428, '4207650', 'Iporã do Oeste', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4429, '4207684', 'Ipuaçu', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4430, '4207700', 'Ipumirim', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4431, '4207759', 'Iraceminha', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4432, '4207809', 'Irani', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4433, '4207858', 'Irati', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4434, '4207908', 'Irineópolis', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4435, '4208005', 'Itá', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4436, '4208104', 'Itaiópolis', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4437, '4208203', 'Itajaí', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4438, '4208302', 'Itapema', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4439, '4208401', 'Itapiranga', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4440, '4208450', 'Itapoá', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4441, '4208500', 'Ituporanga', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4442, '4208609', 'Jaborá', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4443, '4208708', 'Jacinto Machado', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4444, '4208807', 'Jaguaruna', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4445, '4208906', 'Jaraguá do Sul', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4446, '4208955', 'Jardinópolis', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4447, '4209003', 'Joaçaba', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4448, '4209102', 'Joinville', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4449, '4209151', 'José Boiteux', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4450, '4209177', 'Jupiá', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4451, '4209201', 'Lacerdópolis', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4452, '4209300', 'Lages', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4453, '4209409', 'Laguna', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4454, '4209458', 'Lajeado Grande', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4455, '4209508', 'Laurentino', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4456, '4209607', 'Lauro Muller', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4457, '4209706', 'Lebon Régis', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4458, '4209805', 'Leoberto Leal', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4459, '4209854', 'Lindóia do Sul', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4460, '4209904', 'Lontras', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4461, '4210001', 'Luiz Alves', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4462, '4210035', 'Luzerna', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4463, '4210050', 'Macieira', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4464, '4210100', 'Mafra', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4465, '4210209', 'Major Gercino', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4466, '4210308', 'Major Vieira', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4467, '4210407', 'Maracajá', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4468, '4210506', 'Maravilha', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4469, '4210555', 'Marema', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4470, '4210605', 'Massaranduba', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4471, '4210704', 'Matos Costa', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4472, '4210803', 'Meleiro', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4473, '4210852', 'Mirim Doce', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4474, '4210902', 'Modelo', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4475, '4211009', 'Mondaí', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4476, '4211058', 'Monte Carlo', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4477, '4211108', 'Monte Castelo', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4478, '4211207', 'Morro da Fumaça', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4479, '4211256', 'Morro Grande', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4480, '4211306', 'Navegantes', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4481, '4211405', 'Nova Erechim', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4482, '4211454', 'Nova Itaberaba', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4483, '4211504', 'Nova Trento', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4484, '4211603', 'Nova Veneza', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4485, '4211652', 'Novo Horizonte', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4486, '4211702', 'Orleans', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4487, '4211751', 'Otacílio Costa', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4488, '4211801', 'Ouro', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4489, '4211850', 'Ouro Verde', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4490, '4211876', 'Paial', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4491, '4211892', 'Painel', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4492, '4211900', 'Palhoça', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4493, '4212007', 'Palma Sola', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4494, '4212056', 'Palmeira', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4495, '4212106', 'Palmitos', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4496, '4212205', 'Papanduva', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4497, '4212239', 'Paraíso', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4498, '4212254', 'Passo de Torres', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4499, '4212270', 'Passos Maia', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4500, '4212304', 'Paulo Lopes', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4501, '4212403', 'Pedras Grandes', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4502, '4212502', 'Penha', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4503, '4212601', 'Peritiba', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4504, '4212650', 'Pescaria Brava', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4505, '4212700', 'Petrolândia', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4506, '4212809', 'Balneário Piçarras', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4507, '4212908', 'Pinhalzinho', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4508, '4213005', 'Pinheiro Preto', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4509, '4213104', 'Piratuba', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4510, '4213153', 'Planalto Alegre', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4511, '4213203', 'Pomerode', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4512, '4213302', 'Ponte Alta', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4513, '4213351', 'Ponte Alta do Norte', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4514, '4213401', 'Ponte Serrada', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4515, '4213500', 'Porto Belo', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4516, '4213609', 'Porto União', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4517, '4213708', 'Pouso Redondo', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4518, '4213807', 'Praia Grande', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4519, '4213906', 'Presidente Castello Branco', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4520, '4214003', 'Presidente Getúlio', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4521, '4214102', 'Presidente Nereu', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4522, '4214151', 'Princesa', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4523, '4214201', 'Quilombo', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4524, '4214300', 'Rancho Queimado', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4525, '4214409', 'Rio das Antas', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4526, '4214508', 'Rio do Campo', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4527, '4214607', 'Rio do Oeste', 'SC', '2024-06-14 16:39:13', '2024-06-14 16:39:13'),
(4528, '4214706', 'Rio dos Cedros', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4529, '4214805', 'Rio do Sul', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4530, '4214904', 'Rio Fortuna', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4531, '4215000', 'Rio Negrinho', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4532, '4215059', 'Rio Rufino', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4533, '4215075', 'Riqueza', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4534, '4215109', 'Rodeio', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4535, '4215208', 'Romelândia', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4536, '4215307', 'Salete', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4537, '4215356', 'Saltinho', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4538, '4215406', 'Salto Veloso', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4539, '4215455', 'Sangão', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4540, '4215505', 'Santa Cecília', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4541, '4215554', 'Santa Helena', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4542, '4215604', 'Santa Rosa de Lima', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4543, '4215653', 'Santa Rosa do Sul', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4544, '4215679', 'Santa Terezinha', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4545, '4215687', 'Santa Terezinha do Progresso', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4546, '4215695', 'Santiago do Sul', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4547, '4215703', 'Santo Amaro da Imperatriz', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4548, '4215752', 'São Bernardino', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4549, '4215802', 'São Bento do Sul', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4550, '4215901', 'São Bonifácio', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4551, '4216008', 'São Carlos', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4552, '4216057', 'São Cristovão do Sul', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4553, '4216107', 'São Domingos', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4554, '4216206', 'São Francisco do Sul', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4555, '4216255', 'São João do Oeste', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4556, '4216305', 'São João Batista', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4557, '4216354', 'São João do Itaperiú', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4558, '4216404', 'São João do Sul', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4559, '4216503', 'São Joaquim', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4560, '4216602', 'São José', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4561, '4216701', 'São José do Cedro', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4562, '4216800', 'São José do Cerrito', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4563, '4216909', 'São Lourenço do Oeste', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4564, '4217006', 'São Ludgero', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4565, '4217105', 'São Martinho', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4566, '4217154', 'São Miguel da Boa Vista', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4567, '4217204', 'São Miguel do Oeste', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4568, '4217253', 'São Pedro de Alcântara', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4569, '4217303', 'Saudades', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4570, '4217402', 'Schroeder', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4571, '4217501', 'Seara', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4572, '4217550', 'Serra Alta', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4573, '4217600', 'Siderópolis', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4574, '4217709', 'Sombrio', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4575, '4217758', 'Sul Brasil', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4576, '4217808', 'Taió', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4577, '4217907', 'Tangará', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4578, '4217956', 'Tigrinhos', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4579, '4218004', 'Tijucas', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4580, '4218103', 'Timbé do Sul', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4581, '4218202', 'Timbó', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4582, '4218251', 'Timbó Grande', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4583, '4218301', 'Três Barras', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4584, '4218350', 'Treviso', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4585, '4218400', 'Treze de Maio', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4586, '4218509', 'Treze Tílias', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4587, '4218608', 'Trombudo Central', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4588, '4218707', 'Tubarão', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4589, '4218756', 'Tunápolis', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4590, '4218806', 'Turvo', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4591, '4218855', 'União do Oeste', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4592, '4218905', 'Urubici', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4593, '4218954', 'Urupema', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4594, '4219002', 'Urussanga', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4595, '4219101', 'Vargeão', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4596, '4219150', 'Vargem', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4597, '4219176', 'Vargem Bonita', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4598, '4219200', 'Vidal Ramos', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4599, '4219309', 'Videira', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4600, '4219358', 'Vitor Meireles', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4601, '4219408', 'Witmarsum', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4602, '4219507', 'Xanxerê', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4603, '4219606', 'Xavantina', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4604, '4219705', 'Xaxim', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4605, '4219853', 'Zortéa', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4606, '4220000', 'Balneário Rincão', 'SC', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4607, '4300034', 'Aceguá', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4608, '4300059', 'Água Santa', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4609, '4300109', 'Agudo', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4610, '4300208', 'Ajuricaba', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4611, '4300307', 'Alecrim', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4612, '4300406', 'Alegrete', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4613, '4300455', 'Alegria', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4614, '4300471', 'Almirante Tamandaré do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4615, '4300505', 'Alpestre', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4616, '4300554', 'Alto Alegre', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4617, '4300570', 'Alto Feliz', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4618, '4300604', 'Alvorada', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4619, '4300638', 'Amaral Ferrador', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4620, '4300646', 'Ametista do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4621, '4300661', 'André da Rocha', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4622, '4300703', 'Anta Gorda', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4623, '4300802', 'Antônio Prado', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4624, '4300851', 'Arambaré', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4625, '4300877', 'Araricá', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4626, '4300901', 'Aratiba', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4627, '4301008', 'Arroio do Meio', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4628, '4301057', 'Arroio do Sal', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4629, '4301073', 'Arroio do Padre', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4630, '4301107', 'Arroio dos Ratos', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4631, '4301206', 'Arroio do Tigre', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4632, '4301305', 'Arroio Grande', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4633, '4301404', 'Arvorezinha', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4634, '4301503', 'Augusto Pestana', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4635, '4301552', 'Áurea', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4636, '4301602', 'Bagé', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4637, '4301636', 'Balneário Pinhal', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4638, '4301651', 'Barão', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4639, '4301701', 'Barão de Cotegipe', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4640, '4301750', 'Barão do Triunfo', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4641, '4301800', 'Barracão', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4642, '4301859', 'Barra do Guarita', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4643, '4301875', 'Barra do Quaraí', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4644, '4301909', 'Barra do Ribeiro', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4645, '4301925', 'Barra do Rio Azul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4646, '4301958', 'Barra Funda', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4647, '4302006', 'Barros Cassal', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4648, '4302055', 'Benjamin Constant do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4649, '4302105', 'Bento Gonçalves', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4650, '4302154', 'Boa Vista das Missões', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4651, '4302204', 'Boa Vista do Buricá', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4652, '4302220', 'Boa Vista do Cadeado', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4653, '4302238', 'Boa Vista do Incra', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4654, '4302253', 'Boa Vista do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4655, '4302303', 'Bom Jesus', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4656, '4302352', 'Bom Princípio', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4657, '4302378', 'Bom Progresso', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4658, '4302402', 'Bom Retiro do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4659, '4302451', 'Boqueirão do Leão', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4660, '4302501', 'Bossoroca', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4661, '4302584', 'Bozano', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4662, '4302600', 'Braga', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4663, '4302659', 'Brochier', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4664, '4302709', 'Butiá', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4665, '4302808', 'Caçapava do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4666, '4302907', 'Cacequi', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4667, '4303004', 'Cachoeira do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4668, '4303103', 'Cachoeirinha', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4669, '4303202', 'Cacique Doble', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4670, '4303301', 'Caibaté', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4671, '4303400', 'Caiçara', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4672, '4303509', 'Camaquã', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4673, '4303558', 'Camargo', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4674, '4303608', 'Cambará do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4675, '4303673', 'Campestre da Serra', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4676, '4303707', 'Campina das Missões', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4677, '4303806', 'Campinas do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4678, '4303905', 'Campo Bom', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4679, '4304002', 'Campo Novo', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4680, '4304101', 'Campos Borges', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4681, '4304200', 'Candelária', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4682, '4304309', 'Cândido Godói', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4683, '4304358', 'Candiota', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4684, '4304408', 'Canela', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4685, '4304507', 'Canguçu', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4686, '4304606', 'Canoas', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4687, '4304614', 'Canudos do Vale', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4688, '4304622', 'Capão Bonito do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4689, '4304630', 'Capão da Canoa', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4690, '4304655', 'Capão do Cipó', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4691, '4304663', 'Capão do Leão', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4692, '4304671', 'Capivari do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4693, '4304689', 'Capela de Santana', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4694, '4304697', 'Capitão', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4695, '4304705', 'Carazinho', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4696, '4304713', 'Caraá', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4697, '4304804', 'Carlos Barbosa', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4698, '4304853', 'Carlos Gomes', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4699, '4304903', 'Casca', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4700, '4304952', 'Caseiros', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4701, '4305009', 'Catuípe', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4702, '4305108', 'Caxias do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4703, '4305116', 'Centenário', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4704, '4305124', 'Cerrito', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4705, '4305132', 'Cerro Branco', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4706, '4305157', 'Cerro Grande', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4707, '4305173', 'Cerro Grande do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4708, '4305207', 'Cerro Largo', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4709, '4305306', 'Chapada', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4710, '4305355', 'Charqueadas', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4711, '4305371', 'Charrua', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4712, '4305405', 'Chiapetta', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4713, '4305439', 'Chuí', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4714, '4305447', 'Chuvisca', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4715, '4305454', 'Cidreira', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4716, '4305504', 'Ciríaco', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4717, '4305587', 'Colinas', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4718, '4305603', 'Colorado', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4719, '4305702', 'Condor', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4720, '4305801', 'Constantina', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4721, '4305835', 'Coqueiro Baixo', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4722, '4305850', 'Coqueiros do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4723, '4305871', 'Coronel Barros', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4724, '4305900', 'Coronel Bicaco', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4725, '4305934', 'Coronel Pilar', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4726, '4305959', 'Cotiporã', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4727, '4305975', 'Coxilha', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4728, '4306007', 'Crissiumal', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4729, '4306056', 'Cristal', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4730, '4306072', 'Cristal do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4731, '4306106', 'Cruz Alta', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4732, '4306130', 'Cruzaltense', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(4733, '4306205', 'Cruzeiro do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4734, '4306304', 'David Canabarro', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4735, '4306320', 'Derrubadas', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4736, '4306353', 'Dezesseis de Novembro', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4737, '4306379', 'Dilermando de Aguiar', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4738, '4306403', 'Dois Irmãos', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4739, '4306429', 'Dois Irmãos das Missões', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4740, '4306452', 'Dois Lajeados', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4741, '4306502', 'Dom Feliciano', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4742, '4306551', 'Dom Pedro de Alcântara', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4743, '4306601', 'Dom Pedrito', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4744, '4306700', 'Dona Francisca', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4745, '4306734', 'Doutor Maurício Cardoso', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4746, '4306759', 'Doutor Ricardo', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4747, '4306767', 'Eldorado do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4748, '4306809', 'Encantado', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4749, '4306908', 'Encruzilhada do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4750, '4306924', 'Engenho Velho', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4751, '4306932', 'Entre-Ijuís', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4752, '4306957', 'Entre Rios do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4753, '4306973', 'Erebango', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4754, '4307005', 'Erechim', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4755, '4307054', 'Ernestina', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4756, '4307104', 'Herval', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4757, '4307203', 'Erval Grande', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4758, '4307302', 'Erval Seco', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4759, '4307401', 'Esmeralda', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4760, '4307450', 'Esperança do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4761, '4307500', 'Espumoso', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4762, '4307559', 'Estação', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4763, '4307609', 'Estância Velha', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4764, '4307708', 'Esteio', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4765, '4307807', 'Estrela', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4766, '4307815', 'Estrela Velha', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4767, '4307831', 'Eugênio de Castro', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4768, '4307864', 'Fagundes Varela', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4769, '4307906', 'Farroupilha', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4770, '4308003', 'Faxinal do Soturno', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4771, '4308052', 'Faxinalzinho', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4772, '4308078', 'Fazenda Vilanova', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4773, '4308102', 'Feliz', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4774, '4308201', 'Flores da Cunha', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4775, '4308250', 'Floriano Peixoto', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4776, '4308300', 'Fontoura Xavier', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4777, '4308409', 'Formigueiro', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4778, '4308433', 'Forquetinha', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4779, '4308458', 'Fortaleza dos Valos', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4780, '4308508', 'Frederico Westphalen', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4781, '4308607', 'Garibaldi', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4782, '4308656', 'Garruchos', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4783, '4308706', 'Gaurama', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4784, '4308805', 'General Câmara', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4785, '4308854', 'Gentil', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4786, '4308904', 'Getúlio Vargas', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4787, '4309001', 'Giruá', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4788, '4309050', 'Glorinha', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4789, '4309100', 'Gramado', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4790, '4309126', 'Gramado dos Loureiros', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4791, '4309159', 'Gramado Xavier', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4792, '4309209', 'Gravataí', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4793, '4309258', 'Guabiju', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4794, '4309308', 'Guaíba', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4795, '4309407', 'Guaporé', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4796, '4309506', 'Guarani das Missões', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4797, '4309555', 'Harmonia', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4798, '4309571', 'Herveiras', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4799, '4309605', 'Horizontina', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4800, '4309654', 'Hulha Negra', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4801, '4309704', 'Humaitá', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4802, '4309753', 'Ibarama', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4803, '4309803', 'Ibiaçá', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4804, '4309902', 'Ibiraiaras', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4805, '4309951', 'Ibirapuitã', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4806, '4310009', 'Ibirubá', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4807, '4310108', 'Igrejinha', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4808, '4310207', 'Ijuí', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4809, '4310306', 'Ilópolis', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4810, '4310330', 'Imbé', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4811, '4310363', 'Imigrante', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4812, '4310405', 'Independência', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4813, '4310413', 'Inhacorá', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4814, '4310439', 'Ipê', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4815, '4310462', 'Ipiranga do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4816, '4310504', 'Iraí', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4817, '4310538', 'Itaara', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4818, '4310553', 'Itacurubi', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4819, '4310579', 'Itapuca', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4820, '4310603', 'Itaqui', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4821, '4310652', 'Itati', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4822, '4310702', 'Itatiba do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4823, '4310751', 'Ivorá', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4824, '4310801', 'Ivoti', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4825, '4310850', 'Jaboticaba', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4826, '4310876', 'Jacuizinho', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4827, '4310900', 'Jacutinga', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4828, '4311007', 'Jaguarão', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4829, '4311106', 'Jaguari', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4830, '4311122', 'Jaquirana', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4831, '4311130', 'Jari', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4832, '4311155', 'Jóia', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4833, '4311205', 'Júlio de Castilhos', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4834, '4311239', 'Lagoa Bonita do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4835, '4311254', 'Lagoão', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4836, '4311270', 'Lagoa dos Três Cantos', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4837, '4311304', 'Lagoa Vermelha', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4838, '4311403', 'Lajeado', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4839, '4311429', 'Lajeado do Bugre', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4840, '4311502', 'Lavras do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4841, '4311601', 'Liberato Salzano', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4842, '4311627', 'Lindolfo Collor', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4843, '4311643', 'Linha Nova', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4844, '4311700', 'Machadinho', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4845, '4311718', 'Maçambará', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4846, '4311734', 'Mampituba', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4847, '4311759', 'Manoel Viana', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4848, '4311775', 'Maquiné', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4849, '4311791', 'Maratá', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4850, '4311809', 'Marau', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4851, '4311908', 'Marcelino Ramos', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4852, '4311981', 'Mariana Pimentel', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4853, '4312005', 'Mariano Moro', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4854, '4312054', 'Marques de Souza', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4855, '4312104', 'Mata', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4856, '4312138', 'Mato Castelhano', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4857, '4312153', 'Mato Leitão', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4858, '4312179', 'Mato Queimado', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4859, '4312203', 'Maximiliano de Almeida', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4860, '4312252', 'Minas do Leão', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4861, '4312302', 'Miraguaí', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4862, '4312351', 'Montauri', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4863, '4312377', 'Monte Alegre dos Campos', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4864, '4312385', 'Monte Belo do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4865, '4312401', 'Montenegro', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4866, '4312427', 'Mormaço', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4867, '4312443', 'Morrinhos do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4868, '4312450', 'Morro Redondo', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4869, '4312476', 'Morro Reuter', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4870, '4312500', 'Mostardas', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4871, '4312609', 'Muçum', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4872, '4312617', 'Muitos Capões', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4873, '4312625', 'Muliterno', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4874, '4312658', 'Não-Me-Toque', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4875, '4312674', 'Nicolau Vergueiro', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4876, '4312708', 'Nonoai', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4877, '4312757', 'Nova Alvorada', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4878, '4312807', 'Nova Araçá', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4879, '4312906', 'Nova Bassano', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4880, '4312955', 'Nova Boa Vista', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4881, '4313003', 'Nova Bréscia', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4882, '4313011', 'Nova Candelária', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4883, '4313037', 'Nova Esperança do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4884, '4313060', 'Nova Hartz', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4885, '4313086', 'Nova Pádua', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4886, '4313102', 'Nova Palma', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4887, '4313201', 'Nova Petrópolis', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4888, '4313300', 'Nova Prata', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4889, '4313334', 'Nova Ramada', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4890, '4313359', 'Nova Roma do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4891, '4313375', 'Nova Santa Rita', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4892, '4313391', 'Novo Cabrais', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4893, '4313409', 'Novo Hamburgo', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4894, '4313425', 'Novo Machado', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4895, '4313441', 'Novo Tiradentes', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4896, '4313466', 'Novo Xingu', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4897, '4313490', 'Novo Barreiro', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4898, '4313508', 'Osório', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4899, '4313607', 'Paim Filho', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4900, '4313656', 'Palmares do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4901, '4313706', 'Palmeira das Missões', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4902, '4313805', 'Palmitinho', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4903, '4313904', 'Panambi', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4904, '4313953', 'Pantano Grande', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4905, '4314001', 'Paraí', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4906, '4314027', 'Paraíso do Sul', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4907, '4314035', 'Pareci Novo', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4908, '4314050', 'Parobé', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4909, '4314068', 'Passa Sete', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4910, '4314076', 'Passo do Sobrado', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4911, '4314100', 'Passo Fundo', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4912, '4314134', 'Paulo Bento', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4913, '4314159', 'Paverama', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4914, '4314175', 'Pedras Altas', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4915, '4314209', 'Pedro Osório', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4916, '4314308', 'Pejuçara', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4917, '4314407', 'Pelotas', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4918, '4314423', 'Picada Café', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4919, '4314456', 'Pinhal', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4920, '4314464', 'Pinhal da Serra', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4921, '4314472', 'Pinhal Grande', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4922, '4314498', 'Pinheirinho do Vale', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4923, '4314506', 'Pinheiro Machado', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4924, '4314548', 'Pinto Bandeira', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4925, '4314555', 'Pirapó', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4926, '4314605', 'Piratini', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4927, '4314704', 'Planalto', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4928, '4314753', 'Poço das Antas', 'RS', '2024-06-14 16:39:14', '2024-06-14 16:39:14'),
(4929, '4314779', 'Pontão', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4930, '4314787', 'Ponte Preta', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4931, '4314803', 'Portão', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4932, '4314902', 'Porto Alegre', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4933, '4315008', 'Porto Lucena', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4934, '4315057', 'Porto Mauá', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4935, '4315073', 'Porto Vera Cruz', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4936, '4315107', 'Porto Xavier', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4937, '4315131', 'Pouso Novo', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4938, '4315149', 'Presidente Lucena', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4939, '4315156', 'Progresso', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4940, '4315172', 'Protásio Alves', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4941, '4315206', 'Putinga', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4942, '4315305', 'Quaraí', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4943, '4315313', 'Quatro Irmãos', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4944, '4315321', 'Quevedos', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4945, '4315354', 'Quinze de Novembro', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4946, '4315404', 'Redentora', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4947, '4315453', 'Relvado', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4948, '4315503', 'Restinga Seca', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4949, '4315552', 'Rio dos Índios', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4950, '4315602', 'Rio Grande', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4951, '4315701', 'Rio Pardo', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4952, '4315750', 'Riozinho', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4953, '4315800', 'Roca Sales', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4954, '4315909', 'Rodeio Bonito', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4955, '4315958', 'Rolador', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4956, '4316006', 'Rolante', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4957, '4316105', 'Ronda Alta', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4958, '4316204', 'Rondinha', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4959, '4316303', 'Roque Gonzales', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4960, '4316402', 'Rosário do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4961, '4316428', 'Sagrada Família', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4962, '4316436', 'Saldanha Marinho', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4963, '4316451', 'Salto do Jacuí', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4964, '4316477', 'Salvador das Missões', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4965, '4316501', 'Salvador do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4966, '4316600', 'Sananduva', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4967, '4316709', 'Santa Bárbara do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4968, '4316733', 'Santa Cecília do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4969, '4316758', 'Santa Clara do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4970, '4316808', 'Santa Cruz do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4971, '4316907', 'Santa Maria', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4972, '4316956', 'Santa Maria do Herval', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4973, '4316972', 'Santa Margarida do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4974, '4317004', 'Santana da Boa Vista', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4975, '4317103', 'Sant\'Ana do Livramento', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4976, '4317202', 'Santa Rosa', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4977, '4317251', 'Santa Tereza', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4978, '4317301', 'Santa Vitória do Palmar', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4979, '4317400', 'Santiago', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4980, '4317509', 'Santo Ângelo', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4981, '4317558', 'Santo Antônio do Palma', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4982, '4317608', 'Santo Antônio da Patrulha', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4983, '4317707', 'Santo Antônio das Missões', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4984, '4317756', 'Santo Antônio do Planalto', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4985, '4317806', 'Santo Augusto', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4986, '4317905', 'Santo Cristo', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4987, '4317954', 'Santo Expedito do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4988, '4318002', 'São Borja', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4989, '4318051', 'São Domingos do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4990, '4318101', 'São Francisco de Assis', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4991, '4318200', 'São Francisco de Paula', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4992, '4318309', 'São Gabriel', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4993, '4318408', 'São Jerônimo', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4994, '4318424', 'São João da Urtiga', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4995, '4318432', 'São João do Polêsine', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4996, '4318440', 'São Jorge', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4997, '4318457', 'São José das Missões', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4998, '4318465', 'São José do Herval', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(4999, '4318481', 'São José do Hortêncio', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5000, '4318499', 'São José do Inhacorá', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5001, '4318507', 'São José do Norte', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5002, '4318606', 'São José do Ouro', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5003, '4318614', 'São José do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5004, '4318622', 'São José dos Ausentes', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5005, '4318705', 'São Leopoldo', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5006, '4318804', 'São Lourenço do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5007, '4318903', 'São Luiz Gonzaga', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5008, '4319000', 'São Marcos', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5009, '4319109', 'São Martinho', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5010, '4319125', 'São Martinho da Serra', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5011, '4319158', 'São Miguel das Missões', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5012, '4319208', 'São Nicolau', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5013, '4319307', 'São Paulo das Missões', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5014, '4319356', 'São Pedro da Serra', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5015, '4319364', 'São Pedro das Missões', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5016, '4319372', 'São Pedro do Butiá', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5017, '4319406', 'São Pedro do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5018, '4319505', 'São Sebastião do Caí', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5019, '4319604', 'São Sepé', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5020, '4319703', 'São Valentim', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5021, '4319711', 'São Valentim do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5022, '4319737', 'São Valério do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5023, '4319752', 'São Vendelino', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5024, '4319802', 'São Vicente do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5025, '4319901', 'Sapiranga', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5026, '4320008', 'Sapucaia do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5027, '4320107', 'Sarandi', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5028, '4320206', 'Seberi', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5029, '4320230', 'Sede Nova', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5030, '4320263', 'Segredo', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5031, '4320305', 'Selbach', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5032, '4320321', 'Senador Salgado Filho', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5033, '4320354', 'Sentinela do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5034, '4320404', 'Serafina Corrêa', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5035, '4320453', 'Sério', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5036, '4320503', 'Sertão', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5037, '4320552', 'Sertão Santana', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5038, '4320578', 'Sete de Setembro', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5039, '4320602', 'Severiano de Almeida', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5040, '4320651', 'Silveira Martins', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5041, '4320677', 'Sinimbu', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5042, '4320701', 'Sobradinho', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5043, '4320800', 'Soledade', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5044, '4320859', 'Tabaí', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5045, '4320909', 'Tapejara', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5046, '4321006', 'Tapera', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5047, '4321105', 'Tapes', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5048, '4321204', 'Taquara', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5049, '4321303', 'Taquari', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5050, '4321329', 'Taquaruçu do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5051, '4321352', 'Tavares', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5052, '4321402', 'Tenente Portela', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5053, '4321436', 'Terra de Areia', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5054, '4321451', 'Teutônia', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5055, '4321469', 'Tio Hugo', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5056, '4321477', 'Tiradentes do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5057, '4321493', 'Toropi', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5058, '4321501', 'Torres', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5059, '4321600', 'Tramandaí', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5060, '4321626', 'Travesseiro', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5061, '4321634', 'Três Arroios', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5062, '4321667', 'Três Cachoeiras', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5063, '4321709', 'Três Coroas', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5064, '4321808', 'Três de Maio', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5065, '4321832', 'Três Forquilhas', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5066, '4321857', 'Três Palmeiras', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5067, '4321907', 'Três Passos', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5068, '4321956', 'Trindade do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5069, '4322004', 'Triunfo', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5070, '4322103', 'Tucunduva', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5071, '4322152', 'Tunas', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5072, '4322186', 'Tupanci do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5073, '4322202', 'Tupanciretã', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5074, '4322251', 'Tupandi', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5075, '4322301', 'Tuparendi', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5076, '4322327', 'Turuçu', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5077, '4322343', 'Ubiretama', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5078, '4322350', 'União da Serra', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5079, '4322376', 'Unistalda', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5080, '4322400', 'Uruguaiana', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5081, '4322509', 'Vacaria', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5082, '4322525', 'Vale Verde', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5083, '4322533', 'Vale do Sol', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5084, '4322541', 'Vale Real', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5085, '4322558', 'Vanini', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5086, '4322608', 'Venâncio Aires', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5087, '4322707', 'Vera Cruz', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5088, '4322806', 'Veranópolis', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5089, '4322855', 'Vespasiano Correa', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5090, '4322905', 'Viadutos', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5091, '4323002', 'Viamão', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5092, '4323101', 'Vicente Dutra', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5093, '4323200', 'Victor Graeff', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5094, '4323309', 'Vila Flores', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5095, '4323358', 'Vila Lângaro', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5096, '4323408', 'Vila Maria', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5097, '4323457', 'Vila Nova do Sul', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5098, '4323507', 'Vista Alegre', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5099, '4323606', 'Vista Alegre do Prata', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5100, '4323705', 'Vista Gaúcha', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5101, '4323754', 'Vitória das Missões', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5102, '4323770', 'Westfalia', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5103, '4323804', 'Xangri-lá', 'RS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5104, '5000203', 'Água Clara', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5105, '5000252', 'Alcinópolis', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5106, '5000609', 'Amambai', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5107, '5000708', 'Anastácio', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5108, '5000807', 'Anaurilândia', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5109, '5000856', 'Angélica', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5110, '5000906', 'Antônio João', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5111, '5001003', 'Aparecida do Taboado', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5112, '5001102', 'Aquidauana', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5113, '5001243', 'Aral Moreira', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5114, '5001508', 'Bandeirantes', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5115, '5001904', 'Bataguassu', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5116, '5002001', 'Batayporã', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5117, '5002100', 'Bela Vista', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5118, '5002159', 'Bodoquena', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5119, '5002209', 'Bonito', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5120, '5002308', 'Brasilândia', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5121, '5002407', 'Caarapó', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5122, '5002605', 'Camapuã', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5123, '5002704', 'Campo Grande', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5124, '5002803', 'Caracol', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5125, '5002902', 'Cassilândia', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5126, '5002951', 'Chapadão do Sul', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5127, '5003108', 'Corguinho', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5128, '5003157', 'Coronel Sapucaia', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5129, '5003207', 'Corumbá', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5130, '5003256', 'Costa Rica', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5131, '5003306', 'Coxim', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5132, '5003454', 'Deodápolis', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5133, '5003488', 'Dois Irmãos do Buriti', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5134, '5003504', 'Douradina', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5135, '5003702', 'Dourados', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5136, '5003751', 'Eldorado', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5137, '5003801', 'Fátima do Sul', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5138, '5003900', 'Figueirão', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5139, '5004007', 'Glória de Dourados', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5140, '5004106', 'Guia Lopes da Laguna', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5141, '5004304', 'Iguatemi', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5142, '5004403', 'Inocência', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5143, '5004502', 'Itaporã', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5144, '5004601', 'Itaquiraí', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5145, '5004700', 'Ivinhema', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5146, '5004809', 'Japorã', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5147, '5004908', 'Jaraguari', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5148, '5005004', 'Jardim', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5149, '5005103', 'Jateí', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5150, '5005152', 'Juti', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5151, '5005202', 'Ladário', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5152, '5005251', 'Laguna Carapã', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5153, '5005400', 'Maracaju', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5154, '5005608', 'Miranda', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5155, '5005681', 'Mundo Novo', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5156, '5005707', 'Naviraí', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5157, '5005806', 'Nioaque', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5158, '5006002', 'Nova Alvorada do Sul', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5159, '5006200', 'Nova Andradina', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5160, '5006259', 'Novo Horizonte do Sul', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5161, '5006275', 'Paraíso das Águas', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5162, '5006309', 'Paranaíba', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5163, '5006358', 'Paranhos', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5164, '5006408', 'Pedro Gomes', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5165, '5006606', 'Ponta Porã', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5166, '5006903', 'Porto Murtinho', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5167, '5007109', 'Ribas do Rio Pardo', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5168, '5007208', 'Rio Brilhante', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5169, '5007307', 'Rio Negro', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5170, '5007406', 'Rio Verde de Mato Grosso', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5171, '5007505', 'Rochedo', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5172, '5007554', 'Santa Rita do Pardo', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5173, '5007695', 'São Gabriel do Oeste', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5174, '5007703', 'Sete Quedas', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5175, '5007802', 'Selvíria', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5176, '5007901', 'Sidrolândia', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5177, '5007935', 'Sonora', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5178, '5007950', 'Tacuru', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5179, '5007976', 'Taquarussu', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5180, '5008008', 'Terenos', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5181, '5008305', 'Três Lagoas', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5182, '5008404', 'Vicentina', 'MS', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5183, '5100102', 'Acorizal', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5184, '5100201', 'Água Boa', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5185, '5100250', 'Alta Floresta', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5186, '5100300', 'Alto Araguaia', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5187, '5100359', 'Alto Boa Vista', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5188, '5100409', 'Alto Garças', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5189, '5100508', 'Alto Paraguai', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5190, '5100607', 'Alto Taquari', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5191, '5100805', 'Apiacás', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5192, '5101001', 'Araguaiana', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5193, '5101209', 'Araguainha', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5194, '5101258', 'Araputanga', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5195, '5101308', 'Arenápolis', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5196, '5101407', 'Aripuanã', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5197, '5101605', 'Barão de Melgaço', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5198, '5101704', 'Barra do Bugres', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5199, '5101803', 'Barra do Garças', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5200, '5101852', 'Bom Jesus do Araguaia', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5201, '5101902', 'Brasnorte', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5202, '5102504', 'Cáceres', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5203, '5102603', 'Campinápolis', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5204, '5102637', 'Campo Novo do Parecis', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5205, '5102678', 'Campo Verde', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5206, '5102686', 'Campos de Júlio', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5207, '5102694', 'Canabrava do Norte', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5208, '5102702', 'Canarana', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5209, '5102793', 'Carlinda', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5210, '5102850', 'Castanheira', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5211, '5103007', 'Chapada dos Guimarães', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5212, '5103056', 'Cláudia', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5213, '5103106', 'Cocalinho', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5214, '5103205', 'Colíder', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5215, '5103254', 'Colniza', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5216, '5103304', 'Comodoro', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5217, '5103353', 'Confresa', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5218, '5103361', 'Conquista D\'Oeste', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5219, '5103379', 'Cotriguaçu', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5220, '5103403', 'Cuiabá', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5221, '5103437', 'Curvelândia', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5222, '5103452', 'Denise', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5223, '5103502', 'Diamantino', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5224, '5103601', 'Dom Aquino', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5225, '5103700', 'Feliz Natal', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5226, '5103809', 'Figueirópolis D\'Oeste', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5227, '5103858', 'Gaúcha do Norte', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5228, '5103908', 'General Carneiro', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5229, '5103957', 'Glória D\'Oeste', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5230, '5104104', 'Guarantã do Norte', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5231, '5104203', 'Guiratinga', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5232, '5104500', 'Indiavaí', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5233, '5104526', 'Ipiranga do Norte', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5234, '5104542', 'Itanhangá', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5235, '5104559', 'Itaúba', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5236, '5104609', 'Itiquira', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5237, '5104807', 'Jaciara', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5238, '5104906', 'Jangada', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5239, '5105002', 'Jauru', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5240, '5105101', 'Juara', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5241, '5105150', 'Juína', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5242, '5105176', 'Juruena', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5243, '5105200', 'Juscimeira', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5244, '5105234', 'Lambari D\'Oeste', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5245, '5105259', 'Lucas do Rio Verde', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5246, '5105309', 'Luciara', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5247, '5105507', 'Vila Bela da Santíssima Trindade', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5248, '5105580', 'Marcelândia', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5249, '5105606', 'Matupá', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5250, '5105622', 'Mirassol D\'Oeste', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5251, '5105903', 'Nobres', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5252, '5106000', 'Nortelândia', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5253, '5106109', 'Nossa Senhora do Livramento', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5254, '5106158', 'Nova Bandeirantes', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5255, '5106174', 'Nova Nazaré', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5256, '5106182', 'Nova Lacerda', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5257, '5106190', 'Nova Santa Helena', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5258, '5106208', 'Nova Brasilândia', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5259, '5106216', 'Nova Canaã do Norte', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5260, '5106224', 'Nova Mutum', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5261, '5106232', 'Nova Olímpia', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5262, '5106240', 'Nova Ubiratã', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5263, '5106257', 'Nova Xavantina', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5264, '5106265', 'Novo Mundo', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5265, '5106273', 'Novo Horizonte do Norte', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5266, '5106281', 'Novo São Joaquim', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5267, '5106299', 'Paranaíta', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5268, '5106307', 'Paranatinga', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5269, '5106315', 'Novo Santo Antônio', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5270, '5106372', 'Pedra Preta', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5271, '5106422', 'Peixoto de Azevedo', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5272, '5106455', 'Planalto da Serra', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5273, '5106505', 'Poconé', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5274, '5106653', 'Pontal do Araguaia', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5275, '5106703', 'Ponte Branca', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5276, '5106752', 'Pontes e Lacerda', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5277, '5106778', 'Porto Alegre do Norte', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5278, '5106802', 'Porto dos Gaúchos', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5279, '5106828', 'Porto Esperidião', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5280, '5106851', 'Porto Estrela', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5281, '5107008', 'Poxoréo', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5282, '5107040', 'Primavera do Leste', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5283, '5107065', 'Querência', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5284, '5107107', 'São José dos Quatro Marcos', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5285, '5107156', 'Reserva do Cabaçal', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5286, '5107180', 'Ribeirão Cascalheira', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5287, '5107198', 'Ribeirãozinho', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5288, '5107206', 'Rio Branco', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5289, '5107248', 'Santa Carmem', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5290, '5107263', 'Santo Afonso', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5291, '5107297', 'São José do Povo', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5292, '5107305', 'São José do Rio Claro', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5293, '5107354', 'São José do Xingu', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5294, '5107404', 'São Pedro da Cipa', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5295, '5107578', 'Rondolândia', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5296, '5107602', 'Rondonópolis', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5297, '5107701', 'Rosário Oeste', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5298, '5107743', 'Santa Cruz do Xingu', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5299, '5107750', 'Salto do Céu', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5300, '5107768', 'Santa Rita do Trivelato', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5301, '5107776', 'Santa Terezinha', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5302, '5107792', 'Santo Antônio do Leste', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5303, '5107800', 'Santo Antônio do Leverger', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5304, '5107859', 'São Félix do Araguaia', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5305, '5107875', 'Sapezal', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5306, '5107883', 'Serra Nova Dourada', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5307, '5107909', 'Sinop', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5308, '5107925', 'Sorriso', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5309, '5107941', 'Tabaporã', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5310, '5107958', 'Tangará da Serra', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5311, '5108006', 'Tapurah', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5312, '5108055', 'Terra Nova do Norte', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5313, '5108105', 'Tesouro', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5314, '5108204', 'Torixoréu', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5315, '5108303', 'União do Sul', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5316, '5108352', 'Vale de São Domingos', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5317, '5108402', 'Várzea Grande', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5318, '5108501', 'Vera', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15');
INSERT INTO `cidades` (`id`, `codigo`, `nome`, `uf`, `created_at`, `updated_at`) VALUES
(5319, '5108600', 'Vila Rica', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5320, '5108808', 'Nova Guarita', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5321, '5108857', 'Nova Marilândia', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5322, '5108907', 'Nova Maringá', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5323, '5108956', 'Nova Monte Verde', 'MT', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5324, '5200050', 'Abadia de Goiás', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5325, '5200100', 'Abadiânia', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5326, '5200134', 'Acreúna', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5327, '5200159', 'Adelândia', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5328, '5200175', 'Água Fria de Goiás', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5329, '5200209', 'Água Limpa', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5330, '5200258', 'Águas Lindas de Goiás', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5331, '5200308', 'Alexânia', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5332, '5200506', 'Aloândia', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5333, '5200555', 'Alto Horizonte', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5334, '5200605', 'Alto Paraíso de Goiás', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5335, '5200803', 'Alvorada do Norte', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5336, '5200829', 'Amaralina', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5337, '5200852', 'Americano do Brasil', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5338, '5200902', 'Amorinópolis', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5339, '5201108', 'Anápolis', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5340, '5201207', 'Anhanguera', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5341, '5201306', 'Anicuns', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5342, '5201405', 'Aparecida de Goiânia', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5343, '5201454', 'Aparecida do Rio Doce', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5344, '5201504', 'Aporé', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5345, '5201603', 'Araçu', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5346, '5201702', 'Aragarças', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5347, '5201801', 'Aragoiânia', 'GO', '2024-06-14 16:39:15', '2024-06-14 16:39:15'),
(5348, '5202155', 'Araguapaz', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5349, '5202353', 'Arenópolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5350, '5202502', 'Aruanã', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5351, '5202601', 'Aurilândia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5352, '5202809', 'Avelinópolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5353, '5203104', 'Baliza', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5354, '5203203', 'Barro Alto', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5355, '5203302', 'Bela Vista de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5356, '5203401', 'Bom Jardim de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5357, '5203500', 'Bom Jesus de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5358, '5203559', 'Bonfinópolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5359, '5203575', 'Bonópolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5360, '5203609', 'Brazabrantes', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5361, '5203807', 'Britânia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5362, '5203906', 'Buriti Alegre', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5363, '5203939', 'Buriti de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5364, '5203962', 'Buritinópolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5365, '5204003', 'Cabeceiras', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5366, '5204102', 'Cachoeira Alta', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5367, '5204201', 'Cachoeira de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5368, '5204250', 'Cachoeira Dourada', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5369, '5204300', 'Caçu', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5370, '5204409', 'Caiapônia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5371, '5204508', 'Caldas Novas', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5372, '5204557', 'Caldazinha', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5373, '5204607', 'Campestre de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5374, '5204656', 'Campinaçu', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5375, '5204706', 'Campinorte', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5376, '5204805', 'Campo Alegre de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5377, '5204854', 'Campo Limpo de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5378, '5204904', 'Campos Belos', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5379, '5204953', 'Campos Verdes', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5380, '5205000', 'Carmo do Rio Verde', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5381, '5205059', 'Castelândia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5382, '5205109', 'Catalão', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5383, '5205208', 'Caturaí', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5384, '5205307', 'Cavalcante', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5385, '5205406', 'Ceres', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5386, '5205455', 'Cezarina', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5387, '5205471', 'Chapadão do Céu', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5388, '5205497', 'cidades Ocidental', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5389, '5205513', 'Cocalzinho de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5390, '5205521', 'Colinas do Sul', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5391, '5205703', 'Córrego do Ouro', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5392, '5205802', 'Corumbá de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5393, '5205901', 'Corumbaíba', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5394, '5206206', 'Cristalina', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5395, '5206305', 'Cristianópolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5396, '5206404', 'Crixás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5397, '5206503', 'Cromínia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5398, '5206602', 'Cumari', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5399, '5206701', 'Damianópolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5400, '5206800', 'Damolândia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5401, '5206909', 'Davinópolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5402, '5207105', 'Diorama', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5403, '5207253', 'Doverlândia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5404, '5207352', 'Edealina', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5405, '5207402', 'Edéia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5406, '5207501', 'Estrela do Norte', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5407, '5207535', 'Faina', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5408, '5207600', 'Fazenda Nova', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5409, '5207808', 'Firminópolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5410, '5207907', 'Flores de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5411, '5208004', 'Formosa', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5412, '5208103', 'Formoso', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5413, '5208152', 'Gameleira de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5414, '5208301', 'Divinópolis de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5415, '5208400', 'Goianápolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5416, '5208509', 'Goiandira', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5417, '5208608', 'Goianésia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5418, '5208707', 'Goiânia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5419, '5208806', 'Goianira', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5420, '5208905', 'Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5421, '5209101', 'Goiatuba', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5422, '5209150', 'Gouvelândia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5423, '5209200', 'Guapó', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5424, '5209291', 'Guaraíta', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5425, '5209408', 'Guarani de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5426, '5209457', 'Guarinos', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5427, '5209606', 'Heitoraí', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5428, '5209705', 'Hidrolândia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5429, '5209804', 'Hidrolina', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5430, '5209903', 'Iaciara', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5431, '5209937', 'Inaciolândia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5432, '5209952', 'Indiara', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5433, '5210000', 'Inhumas', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5434, '5210109', 'Ipameri', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5435, '5210158', 'Ipiranga de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5436, '5210208', 'Iporá', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5437, '5210307', 'Israelândia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5438, '5210406', 'Itaberaí', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5439, '5210562', 'Itaguari', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5440, '5210604', 'Itaguaru', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5441, '5210802', 'Itajá', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5442, '5210901', 'Itapaci', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5443, '5211008', 'Itapirapuã', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5444, '5211206', 'Itapuranga', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5445, '5211305', 'Itarumã', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5446, '5211404', 'Itauçu', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5447, '5211503', 'Itumbiara', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5448, '5211602', 'Ivolândia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5449, '5211701', 'Jandaia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5450, '5211800', 'Jaraguá', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5451, '5211909', 'Jataí', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5452, '5212006', 'Jaupaci', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5453, '5212055', 'Jesúpolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5454, '5212105', 'Joviânia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5455, '5212204', 'Jussara', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5456, '5212253', 'Lagoa Santa', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5457, '5212303', 'Leopoldo de Bulhões', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5458, '5212501', 'Luziânia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5459, '5212600', 'Mairipotaba', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5460, '5212709', 'Mambaí', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5461, '5212808', 'Mara Rosa', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5462, '5212907', 'Marzagão', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5463, '5212956', 'Matrinchã', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5464, '5213004', 'Maurilândia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5465, '5213053', 'Mimoso de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5466, '5213087', 'Minaçu', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5467, '5213103', 'Mineiros', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5468, '5213400', 'Moiporá', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5469, '5213509', 'Monte Alegre de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5470, '5213707', 'Montes Claros de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5471, '5213756', 'Montividiu', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5472, '5213772', 'Montividiu do Norte', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5473, '5213806', 'Morrinhos', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5474, '5213855', 'Morro Agudo de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5475, '5213905', 'Mossâmedes', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5476, '5214002', 'Mozarlândia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5477, '5214051', 'Mundo Novo', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5478, '5214101', 'Mutunópolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5479, '5214408', 'Nazário', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5480, '5214507', 'Nerópolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5481, '5214606', 'Niquelândia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5482, '5214705', 'Nova América', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5483, '5214804', 'Nova Aurora', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5484, '5214838', 'Nova Crixás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5485, '5214861', 'Nova Glória', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5486, '5214879', 'Nova Iguaçu de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5487, '5214903', 'Nova Roma', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5488, '5215009', 'Nova Veneza', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5489, '5215207', 'Novo Brasil', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5490, '5215231', 'Novo Gama', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5491, '5215256', 'Novo Planalto', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5492, '5215306', 'Orizona', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5493, '5215405', 'Ouro Verde de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5494, '5215504', 'Ouvidor', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5495, '5215603', 'Padre Bernardo', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5496, '5215652', 'Palestina de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5497, '5215702', 'Palmeiras de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5498, '5215801', 'Palmelo', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5499, '5215900', 'Palminópolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5500, '5216007', 'Panamá', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5501, '5216304', 'Paranaiguara', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5502, '5216403', 'Paraúna', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5503, '5216452', 'Perolândia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5504, '5216809', 'Petrolina de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5505, '5216908', 'Pilar de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5506, '5217104', 'Piracanjuba', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5507, '5217203', 'Piranhas', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5508, '5217302', 'Pirenópolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5509, '5217401', 'Pires do Rio', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5510, '5217609', 'Planaltina', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5511, '5217708', 'Pontalina', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5512, '5218003', 'Porangatu', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5513, '5218052', 'Porteirão', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5514, '5218102', 'Portelândia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5515, '5218300', 'Posse', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5516, '5218391', 'Professor Jamil', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5517, '5218508', 'Quirinópolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5518, '5218607', 'Rialma', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5519, '5218706', 'Rianápolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5520, '5218789', 'Rio Quente', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5521, '5218805', 'Rio Verde', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5522, '5218904', 'Rubiataba', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5523, '5219001', 'Sanclerlândia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5524, '5219100', 'Santa Bárbara de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5525, '5219209', 'Santa Cruz de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5526, '5219258', 'Santa Fé de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5527, '5219308', 'Santa Helena de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5528, '5219357', 'Santa Isabel', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5529, '5219407', 'Santa Rita do Araguaia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5530, '5219456', 'Santa Rita do Novo Destino', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5531, '5219506', 'Santa Rosa de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5532, '5219605', 'Santa Tereza de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5533, '5219704', 'Santa Terezinha de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5534, '5219712', 'Santo Antônio da Barra', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5535, '5219738', 'Santo Antônio de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5536, '5219753', 'Santo Antônio do Descoberto', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5537, '5219803', 'São Domingos', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5538, '5219902', 'São Francisco de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5539, '5220009', 'São João D\'Aliança', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5540, '5220058', 'São João da Paraúna', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5541, '5220108', 'São Luís de Montes Belos', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5542, '5220157', 'São Luíz do Norte', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5543, '5220207', 'São Miguel do Araguaia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5544, '5220264', 'São Miguel do Passa Quatro', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5545, '5220280', 'São Patrício', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5546, '5220405', 'São Simão', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5547, '5220454', 'Senador Canedo', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5548, '5220504', 'Serranópolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5549, '5220603', 'Silvânia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5550, '5220686', 'Simolândia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5551, '5220702', 'Sítio D\'Abadia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5552, '5221007', 'Taquaral de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5553, '5221080', 'Teresina de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5554, '5221197', 'Terezópolis de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5555, '5221304', 'Três Ranchos', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5556, '5221403', 'Trindade', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5557, '5221452', 'Trombas', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5558, '5221502', 'Turvânia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5559, '5221551', 'Turvelândia', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5560, '5221577', 'Uirapuru', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5561, '5221601', 'Uruaçu', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5562, '5221700', 'Uruana', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5563, '5221809', 'Urutaí', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5564, '5221858', 'Valparaíso de Goiás', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5565, '5221908', 'Varjão', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5566, '5222005', 'Vianópolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5567, '5222054', 'Vicentinópolis', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5568, '5222203', 'Vila Boa', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5569, '5222302', 'Vila Propício', 'GO', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5570, '5300108', 'Brasília', 'DF', '2024-06-14 16:39:16', '2024-06-14 16:39:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade_deliveries`
--

CREATE TABLE `cidade_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `cidade_deliveries`
--

INSERT INTO `cidade_deliveries` (`id`, `nome`, `uf`, `cep`, `created_at`, `updated_at`) VALUES
(1, 'Jaguariaíva', 'PR', '84200-000', '2024-06-14 16:39:17', '2024-06-14 16:39:17');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ciots`
--

CREATE TABLE `ciots` (
  `id` int(10) UNSIGNED NOT NULL,
  `mdfe_id` int(10) UNSIGNED NOT NULL,
  `cpf_cnpj` varchar(18) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED DEFAULT NULL,
  `razao_social` varchar(100) NOT NULL,
  `nome_fantasia` varchar(80) NOT NULL,
  `cpf_cnpj` varchar(19) NOT NULL DEFAULT '000.000.000-00',
  `rua` varchar(80) NOT NULL,
  `ie_rg` varchar(20) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `consumidor_final` int(11) NOT NULL,
  `contribuinte` int(11) NOT NULL,
  `inativo` tinyint(1) NOT NULL DEFAULT 0,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `limite_venda` decimal(10,2) NOT NULL DEFAULT 0.00,
  `rua_cobranca` varchar(100) DEFAULT NULL,
  `numero_cobranca` varchar(10) DEFAULT NULL,
  `bairro_cobranca` varchar(30) DEFAULT NULL,
  `cep_cobranca` varchar(9) DEFAULT NULL,
  `cidade_cobranca_id` int(10) UNSIGNED DEFAULT NULL,
  `cod_pais` int(11) NOT NULL DEFAULT 1058,
  `id_estrangeiro` varchar(30) DEFAULT NULL,
  `grupo_id` int(11) NOT NULL DEFAULT 0,
  `acessor_id` int(11) NOT NULL DEFAULT 0,
  `contador_nome` varchar(30) DEFAULT NULL,
  `contador_telefone` varchar(15) DEFAULT NULL,
  `contador_email` varchar(60) DEFAULT NULL,
  `funcionario_id` int(11) NOT NULL DEFAULT 0,
  `observacao` varchar(255) DEFAULT NULL,
  `data_aniversario` date DEFAULT NULL,
  `nuvemshop_id` varchar(20) DEFAULT NULL,
  `imagem` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `empresa_id`, `razao_social`, `nome_fantasia`, `cpf_cnpj`, `rua`, `ie_rg`, `numero`, `bairro`, `telefone`, `complemento`, `celular`, `email`, `cep`, `consumidor_final`, `contribuinte`, `inativo`, `cidade_id`, `limite_venda`, `rua_cobranca`, `numero_cobranca`, `bairro_cobranca`, `cep_cobranca`, `cidade_cobranca_id`, `cod_pais`, `id_estrangeiro`, `grupo_id`, `acessor_id`, `contador_nome`, `contador_telefone`, `contador_email`, `funcionario_id`, `observacao`, `data_aniversario`, `nuvemshop_id`, `imagem`, `created_at`, `updated_at`) VALUES
(1, 1, 'Jonathan Crecencio', '', '398.718.058-70', 'Rua Doutor Júlio Prestes', '', '15', 'Vila Valença', NULL, 'Altos', NULL, NULL, '11390-150', 0, 0, 0, 3837, 0.00, NULL, NULL, NULL, NULL, NULL, 1058, NULL, 0, 0, NULL, NULL, NULL, 0, '', '1994-05-10', NULL, '', '2025-01-18 19:41:45', '2025-01-18 19:41:45'),
(2, 2, 'Jonathan Crecencio', '', '398.718.058-70', 'Rua Doutor Júlio Prestes', '', '15', 'Vila Valença', NULL, 'Altos', NULL, NULL, '11390-150', 0, 0, 0, 3837, 0.00, NULL, NULL, NULL, NULL, NULL, 1058, NULL, 0, 0, NULL, NULL, NULL, 0, '', '1994-05-10', NULL, '', '2025-01-25 17:03:01', '2025-01-25 17:03:01'),
(3, 1, 'BRUNO DA SILVA', '', '116.314.098-83', 'Rua Alberto Sá de Souza Varella', '', '123', 'Esplanada dos Barreiros', NULL, 'CASA', '1399123456', 'BRUNODASILVA@GMAIL.COM', '11340-350', 0, 0, 0, 3837, 0.00, NULL, NULL, NULL, NULL, NULL, 1058, NULL, 0, 0, NULL, NULL, NULL, 0, '', '1999-02-12', NULL, '', '2025-01-29 18:48:27', '2025-01-29 18:48:27'),
(4, 1, 'Renata Teixeira', 'Renata Teixeira', '375.016.480-00', 'Avenida Antônio Emmerick', '', '448', 'Vila Cascatinha', NULL, 'Temporário', NULL, NULL, '11390-000', 1, 0, 0, 3837, 0.00, NULL, NULL, NULL, NULL, NULL, 1058, NULL, 0, 0, NULL, NULL, NULL, 0, '', NULL, NULL, '', '2025-02-06 23:51:10', '2025-02-06 23:51:10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente_deliveries`
--

CREATE TABLE `cliente_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) NOT NULL,
  `sobre_nome` varchar(30) NOT NULL,
  `senha` varchar(80) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `token` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `foto` varchar(30) NOT NULL,
  `empresa_id` int(10) UNSIGNED DEFAULT NULL,
  `uid` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente_ecommerces`
--

CREATE TABLE `cliente_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) NOT NULL,
  `sobre_nome` varchar(30) NOT NULL,
  `cpf` varchar(18) NOT NULL,
  `ie` varchar(15) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `token` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `codigo_descontos`
--

CREATE TABLE `codigo_descontos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `codigo` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `tipo` varchar(255) NOT NULL,
  `valor` decimal(10,4) NOT NULL,
  `valor_minimo_pedido` decimal(12,4) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `push` tinyint(1) NOT NULL,
  `sms` tinyint(1) NOT NULL,
  `expiracao` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `comissao_vendas`
--

CREATE TABLE `comissao_vendas` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `funcionario_id` int(10) UNSIGNED DEFAULT NULL,
  `venda_id` int(11) NOT NULL,
  `tabela` varchar(14) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `comissao_vendas`
--

INSERT INTO `comissao_vendas` (`id`, `empresa_id`, `funcionario_id`, `venda_id`, `tabela`, `valor`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 14, 'venda_caixas', 0.40, 0, '2025-01-25 18:11:52', '2025-01-25 18:11:52'),
(2, 2, 3, 15, 'venda_caixas', 14.00, 0, '2025-01-25 18:42:36', '2025-01-25 18:42:36'),
(3, 2, 3, 16, 'venda_caixas', 0.80, 0, '2025-01-25 18:48:13', '2025-01-25 18:48:13'),
(4, 2, 3, 17, 'venda_caixas', 0.40, 0, '2025-01-25 18:49:19', '2025-01-25 18:49:19');

-- --------------------------------------------------------

--
-- Estrutura para tabela `complemento_deliveries`
--

CREATE TABLE `complemento_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `categoria` text NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `componente_ctes`
--

CREATE TABLE `componente_ctes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) NOT NULL,
  `valor` decimal(10,4) NOT NULL,
  `cte_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `compras`
--

CREATE TABLE `compras` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `filial_id` int(10) UNSIGNED DEFAULT NULL,
  `fornecedor_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `chave` varchar(44) DEFAULT NULL,
  `numero_nfe` varchar(20) DEFAULT NULL,
  `numero_emissao` int(11) DEFAULT NULL,
  `estado` enum('novo','aprovado','rejeitado','cancelado') NOT NULL,
  `total` decimal(16,7) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `sequencia_cce` int(11) NOT NULL DEFAULT 0,
  `placa` varchar(9) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `valor_frete` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tipo` int(11) NOT NULL DEFAULT 0,
  `qtd_volumes` int(11) NOT NULL DEFAULT 0,
  `numeracao_volumes` varchar(20) DEFAULT NULL,
  `especie` varchar(20) DEFAULT NULL,
  `peso_liquido` decimal(8,3) NOT NULL DEFAULT 0.000,
  `peso_bruto` decimal(8,3) NOT NULL DEFAULT 0.000,
  `forma_pagamento` varchar(20) DEFAULT NULL,
  `transportadora_id` int(10) UNSIGNED DEFAULT NULL,
  `tipo_pagamento` varchar(2) NOT NULL DEFAULT '',
  `natureza_id` int(11) NOT NULL DEFAULT 0,
  `data_emissao` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `compra_referencias`
--

CREATE TABLE `compra_referencias` (
  `id` int(10) UNSIGNED NOT NULL,
  `compra_id` int(10) UNSIGNED NOT NULL,
  `chave` varchar(44) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `config_caixas`
--

CREATE TABLE `config_caixas` (
  `id` int(10) UNSIGNED NOT NULL,
  `finalizar` varchar(15) NOT NULL,
  `reiniciar` varchar(15) NOT NULL,
  `editar_desconto` varchar(15) NOT NULL,
  `editar_acrescimo` varchar(15) NOT NULL,
  `editar_observacao` varchar(15) NOT NULL,
  `setar_valor_recebido` varchar(15) NOT NULL,
  `forma_pagamento_dinheiro` varchar(15) NOT NULL,
  `forma_pagamento_debito` varchar(15) NOT NULL,
  `forma_pagamento_credito` varchar(15) NOT NULL,
  `forma_pagamento_pix` varchar(15) NOT NULL,
  `setar_leitor` varchar(15) NOT NULL,
  `setar_quantidade` varchar(15) NOT NULL,
  `finalizar_fiscal` varchar(15) NOT NULL,
  `finalizar_nao_fiscal` varchar(15) NOT NULL,
  `valor_recebido_automatico` tinyint(1) NOT NULL,
  `balanca_valor_peso` tinyint(1) NOT NULL,
  `balanca_digito_verificador` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `mercadopago_public_key` varchar(120) NOT NULL,
  `mercadopago_access_token` varchar(120) NOT NULL,
  `impressora_modelo` int(11) NOT NULL DEFAULT 80,
  `modelo_pdv` int(11) NOT NULL DEFAULT 0,
  `tipos_pagamento` varchar(255) NOT NULL DEFAULT '[]',
  `pagamento_padrao` varchar(15) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `config_caixas`
--

INSERT INTO `config_caixas` (`id`, `finalizar`, `reiniciar`, `editar_desconto`, `editar_acrescimo`, `editar_observacao`, `setar_valor_recebido`, `forma_pagamento_dinheiro`, `forma_pagamento_debito`, `forma_pagamento_credito`, `forma_pagamento_pix`, `setar_leitor`, `setar_quantidade`, `finalizar_fiscal`, `finalizar_nao_fiscal`, `valor_recebido_automatico`, `balanca_valor_peso`, `balanca_digito_verificador`, `usuario_id`, `mercadopago_public_key`, `mercadopago_access_token`, `impressora_modelo`, `modelo_pdv`, `tipos_pagamento`, `pagamento_padrao`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 5, 2, '', '', 80, 2, '[\"01\",\"02\",\"03\",\"04\",\"05\",\"06\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"90\",\"99\"]', '', '2025-01-18 17:55:32', '2025-01-18 17:55:32'),
(2, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 5, 3, '', '', 80, 2, '[\"01\",\"02\",\"03\",\"04\",\"05\",\"06\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"90\",\"99\"]', '', '2025-01-18 19:14:22', '2025-01-18 19:14:22'),
(4, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 5, 5, '', '', 80, 2, '[\"01\",\"02\",\"03\",\"04\",\"05\",\"06\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"90\",\"99\"]', '', '2025-01-25 17:03:00', '2025-01-25 17:03:00'),
(5, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 5, 6, '', '', 80, 2, '[\"01\",\"02\",\"03\",\"04\",\"05\",\"06\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"90\",\"99\"]', '', '2025-01-25 17:28:19', '2025-01-25 17:28:19'),
(6, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 5, 7, '', '', 80, 2, '[\"01\",\"02\",\"03\",\"04\",\"05\",\"06\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"90\",\"99\"]', '', '2025-02-07 00:28:13', '2025-02-07 00:28:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `config_ecommerces`
--

CREATE TABLE `config_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) NOT NULL,
  `link` varchar(30) NOT NULL,
  `imagem` varchar(80) NOT NULL,
  `rua` varchar(80) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `cidade_id` varchar(30) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(60) NOT NULL,
  `link_facebook` varchar(120) NOT NULL,
  `link_twiter` varchar(120) NOT NULL,
  `link_instagram` varchar(120) NOT NULL,
  `frete_gratis_valor` decimal(10,2) NOT NULL,
  `mercadopago_public_key` varchar(120) NOT NULL,
  `mercadopago_access_token` varchar(120) NOT NULL,
  `funcionamento` varchar(120) NOT NULL,
  `latitude` varchar(10) NOT NULL,
  `longitude` varchar(10) NOT NULL,
  `politica_privacidade` text NOT NULL,
  `src_mapa` text NOT NULL,
  `cor_principal` varchar(8) NOT NULL,
  `tema_ecommerce` varchar(30) NOT NULL,
  `token` varchar(30) NOT NULL,
  `habilitar_retirada` tinyint(1) NOT NULL DEFAULT 0,
  `desconto_padrao_boleto` decimal(4,2) NOT NULL,
  `desconto_padrao_pix` decimal(4,2) NOT NULL,
  `desconto_padrao_cartao` decimal(4,2) NOT NULL,
  `google_api` varchar(40) NOT NULL DEFAULT '',
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `api_token` varchar(25) NOT NULL DEFAULT '',
  `usar_api` tinyint(1) NOT NULL DEFAULT 0,
  `cor_fundo` varchar(7) NOT NULL DEFAULT '#000',
  `cor_btn` varchar(7) NOT NULL DEFAULT '#000',
  `mensagem_agradecimento` text NOT NULL,
  `img_contato` varchar(80) NOT NULL DEFAULT '',
  `fav_icon` varchar(80) NOT NULL DEFAULT '',
  `timer_carrossel` int(11) NOT NULL DEFAULT 5,
  `formas_pagamento` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `config_notas`
--

CREATE TABLE `config_notas` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `razao_social` varchar(100) NOT NULL,
  `nome_fantasia` varchar(80) NOT NULL,
  `cnpj` varchar(19) NOT NULL,
  `ie` varchar(20) NOT NULL,
  `logradouro` varchar(80) NOT NULL,
  `complemento` varchar(100) NOT NULL DEFAULT '',
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `fone` varchar(20) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `pais` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `CST_CSOSN_padrao` varchar(3) NOT NULL,
  `CST_COFINS_padrao` varchar(3) NOT NULL,
  `CST_PIS_padrao` varchar(3) NOT NULL,
  `CST_IPI_padrao` varchar(3) NOT NULL,
  `frete_padrao` int(11) NOT NULL,
  `tipo_pagamento_padrao` varchar(2) NOT NULL,
  `nat_op_padrao` int(11) NOT NULL,
  `ambiente` int(11) NOT NULL,
  `cUF` varchar(2) NOT NULL,
  `numero_serie_nfe` varchar(3) NOT NULL,
  `numero_serie_nfce` varchar(3) NOT NULL,
  `numero_serie_cte` varchar(3) NOT NULL,
  `numero_serie_mdfe` varchar(3) NOT NULL,
  `ultimo_numero_nfe` int(11) NOT NULL,
  `ultimo_numero_nfce` int(11) NOT NULL,
  `ultimo_numero_cte` int(11) NOT NULL,
  `ultimo_numero_mdfe` int(11) NOT NULL,
  `csc` varchar(60) NOT NULL,
  `csc_id` varchar(10) NOT NULL,
  `inscricao_municipal` varchar(25) NOT NULL DEFAULT '',
  `aut_xml` varchar(20) NOT NULL DEFAULT '',
  `logo` varchar(100) NOT NULL DEFAULT '',
  `validade_orcamento` int(11) NOT NULL DEFAULT 0,
  `casas_decimais` int(11) NOT NULL DEFAULT 2,
  `campo_obs_nfe` text NOT NULL,
  `campo_obs_pedido` text NOT NULL,
  `senha_remover` varchar(80) NOT NULL DEFAULT '',
  `percentual_lucro_padrao` decimal(6,2) NOT NULL DEFAULT 0.00,
  `percentual_max_desconto` decimal(6,2) NOT NULL DEFAULT 0.00,
  `sobrescrita_csonn_consumidor_final` varchar(3) NOT NULL,
  `caixa_por_usuario` tinyint(1) NOT NULL DEFAULT 1,
  `token_ibpt` varchar(80) DEFAULT NULL,
  `arquivo` blob DEFAULT NULL,
  `senha` varchar(30) DEFAULT NULL,
  `usar_email_proprio` tinyint(1) NOT NULL DEFAULT 0,
  `gerenciar_estoque_produto` tinyint(1) NOT NULL DEFAULT 0,
  `token_nfse` varchar(80) DEFAULT NULL,
  `codigo_tributacao_municipio` varchar(80) DEFAULT NULL,
  `alerta_sonoro` varchar(10) DEFAULT NULL,
  `cProdTipo` varchar(15) NOT NULL DEFAULT 'id',
  `parcelamento_maximo` int(11) NOT NULL DEFAULT 12,
  `graficos_dash` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `config_notas`
--

INSERT INTO `config_notas` (`id`, `empresa_id`, `razao_social`, `nome_fantasia`, `cnpj`, `ie`, `logradouro`, `complemento`, `numero`, `bairro`, `fone`, `cep`, `pais`, `email`, `cidade_id`, `CST_CSOSN_padrao`, `CST_COFINS_padrao`, `CST_PIS_padrao`, `CST_IPI_padrao`, `frete_padrao`, `tipo_pagamento_padrao`, `nat_op_padrao`, `ambiente`, `cUF`, `numero_serie_nfe`, `numero_serie_nfce`, `numero_serie_cte`, `numero_serie_mdfe`, `ultimo_numero_nfe`, `ultimo_numero_nfce`, `ultimo_numero_cte`, `ultimo_numero_mdfe`, `csc`, `csc_id`, `inscricao_municipal`, `aut_xml`, `logo`, `validade_orcamento`, `casas_decimais`, `campo_obs_nfe`, `campo_obs_pedido`, `senha_remover`, `percentual_lucro_padrao`, `percentual_max_desconto`, `sobrescrita_csonn_consumidor_final`, `caixa_por_usuario`, `token_ibpt`, `arquivo`, `senha`, `usar_email_proprio`, `gerenciar_estoque_produto`, `token_nfse`, `codigo_tributacao_municipio`, `alerta_sonoro`, `cProdTipo`, `parcelamento_maximo`, `graficos_dash`, `created_at`, `updated_at`) VALUES
(1, 1, 'Jonathan Crecencio', 'Jonathan Crecencio', '398.718.058-70', '98888888888888', 'Avenida Antônio Emmerick', 'Apto 15', '448', 'Vila Cascatinha', '(13) 99154-8068', '11390-000', '', 'jonathancrecencio@outlook.com', 3837, '00', '01', '01', '50', 0, '01', 1, 2, '', '0', '0', '0', '', 0, 0, 0, 0, 'AAAAAAAAA', '000', '', '', 'qW0hRYGNwIjgkcnyKVbXQbtXh.png', 0, 2, '', '', '', 0.00, 0.00, '', 0, '', NULL, NULL, 0, 0, NULL, NULL, NULL, 'id', 12, '', '2025-01-18 18:51:26', '2025-01-25 17:38:31'),
(2, 2, 'CESAR AUGUSTO AZAMBUJA DA SILVA OLIVEIRA 36698078883', 'CESAR AUGUSTO', '41.323.375/0001-70', '130869984110', 'RUA PARACATU', '', '1027', 'PARQUE IMPERIAL', '(13) 98176-8332', '04302-022', '', 'caaso.eng@gmail.com', 3830, '00', '01', '01', '50', 0, '01', 2, 2, '', '000', '987', '0', '', 1, 9870, 0, 0, '0', '0', '', '', 'BXJttrTeFQa6vbWNNa4P68A2Z.png', 0, 2, '', '', '', 0.00, 0.00, '', 0, '', NULL, NULL, 0, 0, NULL, NULL, NULL, 'id', 12, '', '2025-01-25 17:09:52', '2025-01-25 17:50:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contadors`
--

CREATE TABLE `contadors` (
  `id` int(10) UNSIGNED NOT NULL,
  `razao_social` varchar(100) NOT NULL,
  `nome_fantasia` varchar(80) NOT NULL,
  `cnpj` varchar(19) NOT NULL,
  `ie` varchar(20) NOT NULL,
  `logradouro` varchar(80) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `fone` varchar(20) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `email` varchar(80) NOT NULL,
  `percentual_comissao` decimal(5,2) NOT NULL,
  `cidade_id` int(11) NOT NULL,
  `cadastrado_por_cliente` tinyint(1) NOT NULL DEFAULT 0,
  `contador_parceiro` tinyint(1) NOT NULL DEFAULT 0,
  `dados_bancarios` varchar(255) NOT NULL DEFAULT '0',
  `agencia` varchar(15) NOT NULL DEFAULT '',
  `conta` varchar(15) NOT NULL DEFAULT '',
  `banco` varchar(30) NOT NULL DEFAULT '',
  `chave_pix` varchar(50) NOT NULL DEFAULT '',
  `empresa_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contato_ecommerces`
--

CREATE TABLE `contato_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `texto` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contato_funcionarios`
--

CREATE TABLE `contato_funcionarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(40) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `funcionario_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta_bancarias`
--

CREATE TABLE `conta_bancarias` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `banco` varchar(30) NOT NULL,
  `agencia` varchar(10) NOT NULL,
  `conta` varchar(15) NOT NULL,
  `titular` varchar(45) NOT NULL,
  `padrao` tinyint(1) NOT NULL DEFAULT 0,
  `usar_logo` tinyint(1) NOT NULL DEFAULT 0,
  `cnpj` varchar(18) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `carteira` varchar(10) NOT NULL DEFAULT '',
  `convenio` varchar(20) NOT NULL DEFAULT '',
  `juros` decimal(10,2) NOT NULL DEFAULT 0.00,
  `multa` decimal(10,2) NOT NULL DEFAULT 0.00,
  `juros_apos` int(11) NOT NULL DEFAULT 0,
  `tipo` varchar(7) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta_pagars`
--

CREATE TABLE `conta_pagars` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `compra_id` int(10) UNSIGNED DEFAULT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `fornecedor_id` int(11) NOT NULL DEFAULT 0,
  `referencia` varchar(255) NOT NULL,
  `valor_integral` decimal(16,7) NOT NULL,
  `valor_pago` decimal(16,7) NOT NULL DEFAULT 0.0000000,
  `date_register` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_vencimento` date NOT NULL,
  `data_pagamento` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `tipo_pagamento` varchar(20) DEFAULT NULL,
  `filial_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `conta_pagars`
--

INSERT INTO `conta_pagars` (`id`, `empresa_id`, `compra_id`, `categoria_id`, `fornecedor_id`, `referencia`, `valor_integral`, `valor_pago`, `date_register`, `data_vencimento`, `data_pagamento`, `status`, `tipo_pagamento`, `filial_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 1, '25888', 20.0000000, 20.0000000, '2025-01-18 20:14:57', '2025-01-20', '2025-01-18', 1, 'Pix', NULL, '2025-01-18 20:14:57', '2025-01-18 23:34:58');

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta_recebers`
--

CREATE TABLE `conta_recebers` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `venda_id` int(10) UNSIGNED DEFAULT NULL,
  `remessa_nfe_id` int(11) DEFAULT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `referencia` varchar(255) NOT NULL,
  `valor_integral` decimal(16,7) NOT NULL,
  `valor_recebido` decimal(16,7) NOT NULL DEFAULT 0.0000000,
  `date_register` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_vencimento` date NOT NULL,
  `data_recebimento` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `juros` decimal(16,7) NOT NULL DEFAULT 0.0000000,
  `multa` decimal(16,7) NOT NULL DEFAULT 0.0000000,
  `venda_caixa_id` int(10) UNSIGNED DEFAULT NULL,
  `observacao` varchar(100) NOT NULL,
  `tipo_pagamento` varchar(20) NOT NULL,
  `filial_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `conta_recebers`
--

INSERT INTO `conta_recebers` (`id`, `empresa_id`, `venda_id`, `remessa_nfe_id`, `cliente_id`, `categoria_id`, `referencia`, `valor_integral`, `valor_recebido`, `date_register`, `data_vencimento`, `data_recebimento`, `status`, `juros`, `multa`, `venda_caixa_id`, `observacao`, `tipo_pagamento`, `filial_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, 1, 2, '147258', 1200.0000000, 1200.0000000, '2025-01-18 20:12:02', '2025-01-20', '2025-01-18', 1, 0.0000000, 0.0000000, NULL, '', '17', NULL, '2025-01-18 20:12:02', '2025-01-18 23:35:16'),
(2, 1, 4, NULL, 1, 2, 'Parcela 0+1 da Compra código 4', 800.0000000, 800.0000000, '2025-01-18 23:37:10', '2025-01-18', '2025-01-18', 1, 0.0000000, 0.0000000, NULL, '', '17', NULL, '2025-01-18 23:37:10', '2025-01-18 23:40:19'),
(3, 1, 5, NULL, 1, 2, 'Parcela 0+1 da Compra código 5', 50.0000000, 50.0000000, '2025-01-18 23:39:02', '2025-01-18', '2025-01-18', 1, 0.0000000, 0.0000000, NULL, '', '17', NULL, '2025-01-18 23:39:02', '2025-01-18 23:39:35'),
(4, 1, 6, NULL, 1, 2, 'Parcela 0+1 da Compra código 6', 1200.0000000, 1200.0000000, '2025-01-18 23:45:12', '2025-02-17', '2025-01-18', 1, 0.0000000, 0.0000000, NULL, '', '17', NULL, '2025-01-18 23:45:12', '2025-01-18 23:46:24'),
(5, 1, 6, NULL, 1, 2, 'Parcela 1+1 da Compra código 6', 1200.0000000, 1200.0000000, '2025-01-18 23:45:13', '2025-03-19', '2025-02-20', 1, 0.0000000, 0.0000000, NULL, '', '17', NULL, '2025-01-18 23:45:13', '2025-02-20 18:42:17');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contigencias`
--

CREATE TABLE `contigencias` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `tipo` enum('SVCAN','SVCRS','OFFLINE') NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `status_retorno` text NOT NULL,
  `documento` enum('NFe','NFCe','CTe','MDFe') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contratos`
--

CREATE TABLE `contratos` (
  `id` int(10) UNSIGNED NOT NULL,
  `texto` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cotacaos`
--

CREATE TABLE `cotacaos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `fornecedor_id` int(10) UNSIGNED NOT NULL,
  `forma_pagamento` varchar(50) NOT NULL,
  `responsavel` varchar(50) NOT NULL,
  `referencia` varchar(20) NOT NULL,
  `link` varchar(20) NOT NULL,
  `observacao` varchar(100) NOT NULL,
  `resposta` tinyint(1) NOT NULL,
  `ativa` tinyint(1) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `escolhida` tinyint(1) NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `credito_vendas`
--

CREATE TABLE `credito_vendas` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `venda_id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ctes`
--

CREATE TABLE `ctes` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `remetente_id` int(10) UNSIGNED NOT NULL,
  `destinatario_id` int(10) UNSIGNED NOT NULL,
  `expedidor_id` int(10) UNSIGNED DEFAULT NULL,
  `recebedor_id` int(10) UNSIGNED DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `filial_id` int(10) UNSIGNED DEFAULT NULL,
  `natureza_id` int(10) UNSIGNED NOT NULL,
  `tomador` int(11) NOT NULL,
  `municipio_envio` int(10) UNSIGNED NOT NULL,
  `municipio_inicio` int(10) UNSIGNED NOT NULL,
  `municipio_fim` int(10) UNSIGNED NOT NULL,
  `logradouro_tomador` varchar(80) DEFAULT NULL,
  `numero_tomador` varchar(20) DEFAULT NULL,
  `bairro_tomador` varchar(40) DEFAULT NULL,
  `cep_tomador` varchar(10) DEFAULT NULL,
  `municipio_tomador` int(10) UNSIGNED DEFAULT NULL,
  `valor_transporte` decimal(10,2) NOT NULL,
  `valor_receber` decimal(10,2) NOT NULL,
  `valor_carga` decimal(10,2) NOT NULL,
  `produto_predominante` varchar(30) NOT NULL,
  `data_prevista_entrega` date NOT NULL,
  `observacao` varchar(255) NOT NULL,
  `sequencia_cce` int(11) NOT NULL,
  `cte_numero` int(11) NOT NULL DEFAULT 0,
  `chave` varchar(48) NOT NULL,
  `estado_emissao` enum('novo','aprovado','rejeitado','cancelado') NOT NULL,
  `retira` tinyint(1) NOT NULL,
  `detalhes_retira` varchar(100) NOT NULL,
  `modal` varchar(2) NOT NULL,
  `veiculo_id` int(10) UNSIGNED NOT NULL,
  `tpDoc` varchar(2) NOT NULL,
  `descOutros` varchar(100) NOT NULL,
  `nDoc` int(11) NOT NULL,
  `vDocFisc` decimal(10,2) NOT NULL,
  `globalizado` int(11) NOT NULL,
  `cst` varchar(3) NOT NULL DEFAULT '00',
  `perc_icms` decimal(5,2) NOT NULL DEFAULT 0.00,
  `status_pagamento` tinyint(1) NOT NULL DEFAULT 0,
  `tipo_servico` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cte_os`
--

CREATE TABLE `cte_os` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `emitente_id` int(10) UNSIGNED NOT NULL,
  `tomador_id` int(10) UNSIGNED NOT NULL,
  `municipio_envio` int(10) UNSIGNED NOT NULL,
  `municipio_inicio` int(10) UNSIGNED NOT NULL,
  `municipio_fim` int(10) UNSIGNED NOT NULL,
  `veiculo_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `modal` varchar(2) NOT NULL,
  `cst` varchar(3) NOT NULL DEFAULT '00',
  `perc_icms` decimal(5,2) NOT NULL DEFAULT 0.00,
  `valor_transporte` decimal(10,2) NOT NULL,
  `valor_receber` decimal(10,2) NOT NULL,
  `descricao_servico` varchar(100) NOT NULL DEFAULT '',
  `quantidade_carga` decimal(12,4) NOT NULL,
  `natureza_id` int(10) UNSIGNED NOT NULL,
  `tomador` int(11) NOT NULL,
  `sequencia_cce` int(11) NOT NULL,
  `observacao` varchar(200) NOT NULL,
  `numero_emissao` int(11) NOT NULL DEFAULT 0,
  `chave` varchar(48) NOT NULL,
  `estado_emissao` enum('novo','aprovado','cancelado','rejeitado') NOT NULL,
  `data_emissao` timestamp NULL DEFAULT NULL,
  `data_viagem` varchar(10) NOT NULL,
  `horario_viagem` varchar(5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cupom_desconto_ecommerces`
--

CREATE TABLE `cupom_desconto_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `valor_minimo_pedido` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `codigo` varchar(6) NOT NULL,
  `tipo` enum('percentual','fixo') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `curtida_produto_ecommerces`
--

CREATE TABLE `curtida_produto_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `c_te_descargas`
--

CREATE TABLE `c_te_descargas` (
  `id` int(10) UNSIGNED NOT NULL,
  `info_id` int(10) UNSIGNED NOT NULL,
  `chave` varchar(44) NOT NULL,
  `seg_cod_barras` varchar(44) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `delivery_configs`
--

CREATE TABLE `delivery_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `cidade_id` int(10) UNSIGNED DEFAULT NULL,
  `link_face` varchar(255) NOT NULL,
  `link_twiteer` varchar(255) NOT NULL,
  `link_google` varchar(255) NOT NULL,
  `link_instagram` varchar(255) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `rua` varchar(80) NOT NULL,
  `numero` varchar(15) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `tempo_medio_entrega` varchar(10) NOT NULL,
  `tempo_maximo_cancelamento` varchar(10) NOT NULL,
  `valor_entrega` decimal(10,2) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `politica_privacidade` varchar(255) NOT NULL,
  `valor_km` decimal(10,2) NOT NULL,
  `valor_entrega_gratis` int(11) NOT NULL,
  `maximo_km_entrega` int(11) NOT NULL,
  `tipo_entrega` varchar(20) NOT NULL,
  `usar_bairros` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `mercadopago_public_key` varchar(120) NOT NULL,
  `mercadopago_access_token` varchar(120) NOT NULL,
  `maximo_adicionais` int(11) NOT NULL,
  `maximo_adicionais_pizza` int(11) NOT NULL,
  `tipo_divisao_pizza` int(11) NOT NULL,
  `maximo_sabores_pizza` int(11) NOT NULL,
  `logo` varchar(30) NOT NULL,
  `one_signal_app_id` varchar(50) NOT NULL,
  `one_signal_key` varchar(50) NOT NULL,
  `tipos_pagamento` varchar(255) NOT NULL DEFAULT '[]',
  `pedido_minimo` decimal(10,2) NOT NULL,
  `avaliacao_media` decimal(10,2) NOT NULL,
  `api_token` varchar(50) DEFAULT NULL,
  `notificacao_novo_pedido` tinyint(1) NOT NULL DEFAULT 1,
  `autenticacao_sms` tinyint(1) NOT NULL DEFAULT 0,
  `confirmacao_pedido_cliente` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `delivery_config_galerias`
--

CREATE TABLE `delivery_config_galerias` (
  `id` int(10) UNSIGNED NOT NULL,
  `config_id` int(10) UNSIGNED NOT NULL,
  `imagem` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `despesa_ctes`
--

CREATE TABLE `despesa_ctes` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `cte_id` int(10) UNSIGNED NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `destaque_deliveries`
--

CREATE TABLE `destaque_deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED DEFAULT NULL,
  `produto_id` int(10) UNSIGNED DEFAULT NULL,
  `img` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `ordem` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `destaque_delivery_masters`
--

CREATE TABLE `destaque_delivery_masters` (
  `id` int(10) UNSIGNED NOT NULL,
  `img` varchar(80) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descricao` varchar(250) NOT NULL,
  `acao` varchar(250) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `devolucaos`
--

CREATE TABLE `devolucaos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `fornecedor_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `natureza_id` int(10) UNSIGNED NOT NULL,
  `transportadora_id` int(10) UNSIGNED DEFAULT NULL,
  `filial_id` int(10) UNSIGNED DEFAULT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `valor_integral` decimal(10,2) NOT NULL,
  `valor_devolvido` decimal(10,2) NOT NULL,
  `motivo` varchar(100) NOT NULL,
  `observacao` varchar(150) NOT NULL,
  `estado_emissao` enum('novo','aprovado','rejeitado','cancelado') NOT NULL,
  `devolucao_parcial` tinyint(1) NOT NULL,
  `chave_nf_entrada` varchar(48) NOT NULL,
  `nNf` int(11) NOT NULL,
  `vFrete` decimal(10,2) NOT NULL,
  `vDesc` decimal(10,2) NOT NULL,
  `chave_gerada` varchar(44) NOT NULL,
  `numero_gerado` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `sequencia_cce` int(11) NOT NULL DEFAULT 0,
  `transportadora_nome` varchar(100) NOT NULL DEFAULT '',
  `transportadora_cidade` varchar(50) NOT NULL DEFAULT '',
  `transportadora_uf` varchar(2) NOT NULL DEFAULT '',
  `transportadora_cpf_cnpj` varchar(18) NOT NULL DEFAULT '',
  `transportadora_ie` varchar(15) NOT NULL DEFAULT '',
  `transportadora_endereco` varchar(120) NOT NULL DEFAULT '',
  `frete_quantidade` decimal(6,2) NOT NULL DEFAULT 0.00,
  `frete_especie` varchar(20) NOT NULL DEFAULT '',
  `frete_marca` varchar(20) NOT NULL DEFAULT '',
  `frete_numero` varchar(20) NOT NULL DEFAULT '',
  `frete_tipo` int(11) NOT NULL DEFAULT 0,
  `veiculo_placa` varchar(10) NOT NULL DEFAULT '',
  `veiculo_uf` varchar(2) NOT NULL DEFAULT '',
  `frete_peso_bruto` decimal(10,3) NOT NULL DEFAULT 0.000,
  `frete_peso_liquido` decimal(10,3) NOT NULL DEFAULT 0.000,
  `despesa_acessorias` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `divisao_grades`
--

CREATE TABLE `divisao_grades` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `sub_divisao` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `dres`
--

CREATE TABLE `dres` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `inicio` date NOT NULL,
  `fim` date NOT NULL,
  `observacao` varchar(300) NOT NULL,
  `percentual_imposto` decimal(5,2) NOT NULL DEFAULT 0.00,
  `lucro_prejuizo` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `dre_categorias`
--

CREATE TABLE `dre_categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `dre_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresas`
--

CREATE TABLE `empresas` (
  `id` int(10) UNSIGNED NOT NULL,
  `razao_social` varchar(80) NOT NULL,
  `nome_fantasia` varchar(80) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `cpf_cnpj` varchar(18) NOT NULL,
  `hash` varchar(30) NOT NULL DEFAULT '',
  `permissao` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `tipo_representante` tinyint(1) NOT NULL DEFAULT 0,
  `tipo_contador` tinyint(1) NOT NULL DEFAULT 0,
  `perfil_id` int(11) NOT NULL DEFAULT 0,
  `mensagem_bloqueio` varchar(255) NOT NULL DEFAULT '',
  `info_contador` varchar(255) NOT NULL DEFAULT '',
  `contador_id` int(11) NOT NULL DEFAULT 0,
  `cep` varchar(9) DEFAULT NULL,
  `representante_legal` varchar(100) DEFAULT NULL,
  `cpf_representante_legal` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `empresas`
--

INSERT INTO `empresas` (`id`, `razao_social`, `nome_fantasia`, `rua`, `telefone`, `email`, `numero`, `bairro`, `cidade_id`, `cpf_cnpj`, `hash`, `permissao`, `status`, `tipo_representante`, `tipo_contador`, `perfil_id`, `mensagem_bloqueio`, `info_contador`, `contador_id`, `cep`, `representante_legal`, `cpf_representante_legal`, `created_at`, `updated_at`) VALUES
(1, 'HighTech Company', 'HTC', 'Rua Dr Julio Prestes', '(13) 99154-8068', 'jonathancrecencio@outlook.com', '15', 'Vila Valença', 3837, '65.878.263/0001-43', 'nmpkguI2muBS2NMFQ9L8gYuHm8iYNx', '[\"http:\\/\\/127.0.0.1:8000\\/categorias\",\"http:\\/\\/127.0.0.1:8000\\/marcas\",\"http:\\/\\/127.0.0.1:8000\\/produtos\",\"http:\\/\\/127.0.0.1:8000\\/clientes\",\"http:\\/\\/127.0.0.1:8000\\/fornecedores\",\"http:\\/\\/127.0.0.1:8000\\/transportadoras\",\"http:\\/\\/127.0.0.1:8000\\/categoria-servico\",\"http:\\/\\/127.0.0.1:8000\\/servicos\",\"http:\\/\\/127.0.0.1:8000\\/listaDePrecos\",\"http:\\/\\/127.0.0.1:8000\\/categoria-conta\",\"http:\\/\\/127.0.0.1:8000\\/veiculos\",\"http:\\/\\/127.0.0.1:8000\\/formasPagamento\",\"http:\\/\\/127.0.0.1:8000\\/usuarios\",\"http:\\/\\/127.0.0.1:8000\\/compraFiscal\",\"http:\\/\\/127.0.0.1:8000\\/compraManual\",\"http:\\/\\/127.0.0.1:8000\\/compras\",\"http:\\/\\/127.0.0.1:8000\\/cotacao\",\"http:\\/\\/127.0.0.1:8000\\/dfe\",\"http:\\/\\/127.0.0.1:8000\\/devolucao\",\"http:\\/\\/127.0.0.1:8000\\/funcionarios\",\"http:\\/\\/127.0.0.1:8000\\/eventoSalario\",\"http:\\/\\/127.0.0.1:8000\\/funcionarioEventos\",\"http:\\/\\/127.0.0.1:8000\\/apuracaoMensal\",\"http:\\/\\/127.0.0.1:8000\\/estoque\",\"http:\\/\\/127.0.0.1:8000\\/estoque\\/apontamentoProducao\",\"http:\\/\\/127.0.0.1:8000\\/inventario\",\"http:\\/\\/127.0.0.1:8000\\/caixa\",\"http:\\/\\/127.0.0.1:8000\\/vendas\\/create\",\"http:\\/\\/127.0.0.1:8000\\/vendas\",\"http:\\/\\/127.0.0.1:8000\\/frenteCaixa\\/list\",\"http:\\/\\/127.0.0.1:8000\\/frenteCaixa\",\"http:\\/\\/127.0.0.1:8000\\/orcamentoVenda\",\"http:\\/\\/127.0.0.1:8000\\/preVenda\",\"http:\\/\\/127.0.0.1:8000\\/ordemServico\",\"http:\\/\\/127.0.0.1:8000\\/agendamentos\",\"http:\\/\\/127.0.0.1:8000\\/nferemessa\",\"http:\\/\\/127.0.0.1:8000\\/conta-pagar\",\"http:\\/\\/127.0.0.1:8000\\/conta-receber\",\"http:\\/\\/127.0.0.1:8000\\/fluxoCaixa\",\"http:\\/\\/127.0.0.1:8000\\/graficos\",\"http:\\/\\/127.0.0.1:8000\\/cte\",\"http:\\/\\/127.0.0.1:8000\\/cte\\/create\",\"http:\\/\\/127.0.0.1:8000\\/categoriaDespesa\",\"http:\\/\\/127.0.0.1:8000\\/cteOs\",\"http:\\/\\/127.0.0.1:8000\\/cteOs\\/create\",\"http:\\/\\/127.0.0.1:8000\\/relatorios\",\"http:\\/\\/127.0.0.1:8000\\/dre\",\"http:\\/\\/127.0.0.1:8000\\/locacao\\/create\",\"http:\\/\\/127.0.0.1:8000\\/locacao\",\"http:\\/\\/127.0.0.1:8000\\/pedidos\",\"http:\\/\\/127.0.0.1:8000\\/deliveryComplemento\",\"\\/telasPedido\",\"http:\\/\\/127.0.0.1:8000\\/controleCozinha\\/selecionar\",\"http:\\/\\/127.0.0.1:8000\\/mesas\",\"http:\\/\\/127.0.0.1:8000\\/pedidos\\/controleComandas\",\"http:\\/\\/127.0.0.1:8000\\/configNF\",\"http:\\/\\/127.0.0.1:8000\\/escritorio\",\"http:\\/\\/127.0.0.1:8000\\/naturezas\",\"http:\\/\\/127.0.0.1:8000\\/tributos\",\"http:\\/\\/127.0.0.1:8000\\/enviarXml\",\"http:\\/\\/127.0.0.1:8000\\/tickets\"]', 1, 1, 0, 0, '', '', 0, NULL, NULL, NULL, '2024-06-14 16:39:17', '2025-01-18 19:22:58'),
(2, 'CESAR AUGUSTO AZAMBUJA DA SILVA OLIVEIRA 36698078883', 'CESAR AUGUSTO', 'RUA PARACATU', '(13) 98176-8332', 'caaso.eng@gmail.com', '1027', 'PARQUE IMPERIAL', 3830, '41.323.375/0001-70', '', '[\"http:\\/\\/127.0.0.1:8000\\/categorias\",\"http:\\/\\/127.0.0.1:8000\\/marcas\",\"http:\\/\\/127.0.0.1:8000\\/produtos\",\"http:\\/\\/127.0.0.1:8000\\/clientes\",\"http:\\/\\/127.0.0.1:8000\\/fornecedores\",\"http:\\/\\/127.0.0.1:8000\\/categoria-servico\",\"http:\\/\\/127.0.0.1:8000\\/servicos\",\"http:\\/\\/127.0.0.1:8000\\/formasPagamento\",\"http:\\/\\/127.0.0.1:8000\\/usuarios\",\"http:\\/\\/127.0.0.1:8000\\/compraFiscal\",\"http:\\/\\/127.0.0.1:8000\\/compraManual\",\"http:\\/\\/127.0.0.1:8000\\/compras\",\"http:\\/\\/127.0.0.1:8000\\/devolucao\",\"http:\\/\\/127.0.0.1:8000\\/funcionarios\",\"http:\\/\\/127.0.0.1:8000\\/estoque\",\"http:\\/\\/127.0.0.1:8000\\/estoque\\/apontamentoProducao\",\"http:\\/\\/127.0.0.1:8000\\/inventario\",\"http:\\/\\/127.0.0.1:8000\\/caixa\",\"http:\\/\\/127.0.0.1:8000\\/vendas\\/create\",\"http:\\/\\/127.0.0.1:8000\\/vendas\",\"http:\\/\\/127.0.0.1:8000\\/frenteCaixa\\/list\",\"http:\\/\\/127.0.0.1:8000\\/frenteCaixa\",\"http:\\/\\/127.0.0.1:8000\\/orcamentoVenda\",\"http:\\/\\/127.0.0.1:8000\\/preVenda\",\"http:\\/\\/127.0.0.1:8000\\/conta-pagar\",\"http:\\/\\/127.0.0.1:8000\\/conta-receber\",\"http:\\/\\/127.0.0.1:8000\\/fluxoCaixa\",\"http:\\/\\/127.0.0.1:8000\\/graficos\",\"http:\\/\\/127.0.0.1:8000\\/relatorios\",\"http:\\/\\/127.0.0.1:8000\\/pedidos\",\"http:\\/\\/127.0.0.1:8000\\/pedidos\\/controleComandas\",\"http:\\/\\/127.0.0.1:8000\\/configNF\",\"http:\\/\\/127.0.0.1:8000\\/escritorio\",\"http:\\/\\/127.0.0.1:8000\\/naturezas\",\"http:\\/\\/127.0.0.1:8000\\/tributos\",\"http:\\/\\/127.0.0.1:8000\\/enviarXml\",\"http:\\/\\/127.0.0.1:8000\\/tickets\"]', 1, 0, 0, 0, '', '', 0, NULL, NULL, NULL, '2025-01-25 17:03:00', '2025-01-25 18:57:40'),
(3, 'Renata Teixeira', 'Renata Teixeira', 'R. Marechal Mallet', '(13) 99755-9584', 'renata.deus@gmail.com', '380', 'Canto do Forte', 3727, '24.791.117/0001-07', '', '[\"http:\\/\\/127.0.0.1:8000\\/clientes\",\"http:\\/\\/127.0.0.1:8000\\/usuarios\"]', 1, 0, 0, 0, '', '', 0, NULL, NULL, NULL, '2025-02-07 00:28:12', '2025-02-07 00:31:32');

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresa_contratos`
--

CREATE TABLE `empresa_contratos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco_deliveries`
--

CREATE TABLE `endereco_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `rua` varchar(50) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `bairro_id` int(11) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `referencia` varchar(30) NOT NULL,
  `latitude` varchar(10) NOT NULL,
  `longitude` varchar(10) NOT NULL,
  `tipo` enum('casa','trabalho') NOT NULL,
  `principal` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco_ecommerces`
--

CREATE TABLE `endereco_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `rua` varchar(60) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `complemento` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `erro_logs`
--

CREATE TABLE `erro_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `arquivo` varchar(200) NOT NULL,
  `linha` varchar(10) NOT NULL,
  `erro` text NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `erro_logs`
--

INSERT INTO `erro_logs` (`id`, `arquivo`, `linha`, `erro`, `empresa_id`, `created_at`, `updated_at`) VALUES
(1, 'C:\\xampp\\htdocs\\saas\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php', '801', 'SQLSTATE[23000]: Integrity constraint violation: 1451 Cannot delete or update a parent row: a foreign key constraint fails (`saas`.`produto_os`, CONSTRAINT `produto_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`)) (Connection: mysql, SQL: delete from `ordem_servicos` where `id` = 1)', 1, '2025-01-18 21:57:34', '2025-01-18 21:57:34'),
(2, 'C:\\xampp\\htdocs\\saas\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php', '801', 'SQLSTATE[23000]: Integrity constraint violation: 1451 Cannot delete or update a parent row: a foreign key constraint fails (`saas`.`produto_os`, CONSTRAINT `produto_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`)) (Connection: mysql, SQL: delete from `ordem_servicos` where `id` = 2)', 1, '2025-01-18 21:57:50', '2025-01-18 21:57:50'),
(3, 'C:\\xampp\\htdocs\\saas\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php', '801', 'SQLSTATE[23000]: Integrity constraint violation: 1451 Cannot delete or update a parent row: a foreign key constraint fails (`saas`.`produto_os`, CONSTRAINT `produto_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`)) (Connection: mysql, SQL: delete from `ordem_servicos` where `id` = 2)', 1, '2025-01-18 21:57:59', '2025-01-18 21:57:59'),
(4, 'C:\\xampp\\htdocs\\saas\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php', '801', 'SQLSTATE[23000]: Integrity constraint violation: 1451 Cannot delete or update a parent row: a foreign key constraint fails (`saas`.`produto_os`, CONSTRAINT `produto_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`)) (Connection: mysql, SQL: delete from `ordem_servicos` where `id` = 1)', 1, '2025-01-18 21:59:06', '2025-01-18 21:59:06'),
(5, 'C:\\xampp\\htdocs\\saas\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php', '801', 'SQLSTATE[23000]: Integrity constraint violation: 1451 Cannot delete or update a parent row: a foreign key constraint fails (`saas`.`produto_os`, CONSTRAINT `produto_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`)) (Connection: mysql, SQL: delete from `ordem_servicos` where `id` = 1)', 1, '2025-01-18 22:10:49', '2025-01-18 22:10:49'),
(6, 'C:\\xampp\\htdocs\\saas\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php', '801', 'SQLSTATE[23000]: Integrity constraint violation: 1451 Cannot delete or update a parent row: a foreign key constraint fails (`saas`.`produto_os`, CONSTRAINT `produto_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`)) (Connection: mysql, SQL: delete from `ordem_servicos` where `id` = 1)', 1, '2025-01-18 22:11:44', '2025-01-18 22:11:44'),
(7, 'C:\\xampp\\htdocs\\saas\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php', '801', 'SQLSTATE[23000]: Integrity constraint violation: 1451 Cannot delete or update a parent row: a foreign key constraint fails (`saas`.`produto_os`, CONSTRAINT `produto_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`)) (Connection: mysql, SQL: delete from `ordem_servicos` where `id` = 1)', 1, '2025-01-18 22:12:13', '2025-01-18 22:12:13'),
(8, 'C:\\xampp\\htdocs\\saas\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php', '801', 'SQLSTATE[23000]: Integrity constraint violation: 1451 Cannot delete or update a parent row: a foreign key constraint fails (`saas`.`produto_os`, CONSTRAINT `produto_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`)) (Connection: mysql, SQL: delete from `ordem_servicos` where `id` = 1)', 1, '2025-01-18 22:13:38', '2025-01-18 22:13:38'),
(9, 'C:\\xampp\\htdocs\\saas\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php', '801', 'SQLSTATE[23000]: Integrity constraint violation: 1451 Cannot delete or update a parent row: a foreign key constraint fails (`saas`.`produto_os`, CONSTRAINT `produto_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`)) (Connection: mysql, SQL: delete from `ordem_servicos` where `id` = 1)', 1, '2025-01-18 22:23:51', '2025-01-18 22:23:51'),
(10, 'C:\\xampp\\htdocs\\saas\\app\\Http\\Controllers\\ProductController.php', '977', 'Attempt to read property \"id\" on null', 1, '2025-01-19 03:18:25', '2025-01-19 03:18:25'),
(11, 'C:\\xampp\\htdocs\\saas\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php', '801', 'SQLSTATE[23000]: Integrity constraint violation: 1048 Column \'tipo_pagamento\' cannot be null (Connection: mysql, SQL: insert into `venda_caixas` (`tipo_pagamento`, `cliente_id`, `nome`, `bandeira_cartao`, `cAut_cartao`, `cnpj_cartao`, `empresa_id`, `usuario_id`, `desconto`, `acrescimo`, `observacao`, `valor_total`, `estado_emissao`, `chave`, `natureza_id`, `dinheiro_recebido`, `troco`, `forma_pagamento`, `cpf`, `pedido_delivery_id`, `qr_code_base64`, `filial_id`, `updated_at`, `created_at`) values (?, 2, ?, , , , 2, 5, 0, 0, , 140, novo, 0, 2, 0, 0, , , 0, 0, ?, 2025-01-25 15:43:05, 2025-01-25 15:43:05))', 2, '2025-01-25 18:43:05', '2025-01-25 18:43:05'),
(12, 'C:\\xampp\\htdocs\\saas\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php', '801', 'SQLSTATE[23000]: Integrity constraint violation: 1048 Column \'tipo_pagamento\' cannot be null (Connection: mysql, SQL: insert into `venda_caixas` (`tipo_pagamento`, `cliente_id`, `nome`, `bandeira_cartao`, `cAut_cartao`, `cnpj_cartao`, `empresa_id`, `usuario_id`, `desconto`, `acrescimo`, `observacao`, `valor_total`, `estado_emissao`, `chave`, `natureza_id`, `dinheiro_recebido`, `troco`, `forma_pagamento`, `cpf`, `pedido_delivery_id`, `qr_code_base64`, `filial_id`, `updated_at`, `created_at`) values (?, 2, ?, , , , 2, 5, 0, 0, , 140, novo, 0, 2, 0, 0, , , 0, 0, ?, 2025-01-25 15:43:09, 2025-01-25 15:43:09))', 2, '2025-01-25 18:43:09', '2025-01-25 18:43:09'),
(13, 'C:\\xampp\\htdocs\\saas\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php', '801', 'SQLSTATE[23000]: Integrity constraint violation: 1048 Column \'tipo_pagamento\' cannot be null (Connection: mysql, SQL: insert into `venda_caixas` (`tipo_pagamento`, `nome`, `bandeira_cartao`, `cAut_cartao`, `cnpj_cartao`, `empresa_id`, `usuario_id`, `desconto`, `acrescimo`, `observacao`, `valor_total`, `estado_emissao`, `chave`, `natureza_id`, `dinheiro_recebido`, `troco`, `forma_pagamento`, `cpf`, `pedido_delivery_id`, `qr_code_base64`, `filial_id`, `updated_at`, `created_at`) values (?, ?, , , , 1, 2, 0, 0, , 22, novo, 0, 1, 0, 0, , , 0, 0, ?, 2025-01-29 16:03:15, 2025-01-29 16:03:15))', 1, '2025-01-29 19:03:16', '2025-01-29 19:03:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `escritorio_contabils`
--

CREATE TABLE `escritorio_contabils` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `razao_social` varchar(100) NOT NULL,
  `nome_fantasia` varchar(80) NOT NULL,
  `cnpj` varchar(19) NOT NULL,
  `ie` varchar(20) NOT NULL,
  `logradouro` varchar(80) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `fone` varchar(20) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `email` varchar(80) NOT NULL,
  `token_sieg` varchar(255) NOT NULL,
  `envio_automatico_xml_contador` tinyint(1) NOT NULL DEFAULT 0,
  `cidade_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoques`
--

CREATE TABLE `estoques` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `valor_compra` decimal(10,2) NOT NULL,
  `filial_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `estoques`
--

INSERT INTO `estoques` (`id`, `empresa_id`, `produto_id`, `quantidade`, `valor_compra`, `filial_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 84.000, 40.00, NULL, '2025-01-18 19:38:50', '2025-01-29 18:30:37'),
(2, 1, 1, 100.000, 40.00, NULL, '2025-01-18 19:50:03', '2025-01-18 19:50:03'),
(3, 2, 4, 1.000, 1.50, NULL, '2025-01-25 17:23:44', '2025-01-25 19:00:45'),
(4, 1, 5, 93.000, 20.00, NULL, '2025-01-29 18:46:08', '2025-01-29 19:01:36');

-- --------------------------------------------------------

--
-- Estrutura para tabela `etiquetas`
--

CREATE TABLE `etiquetas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(40) NOT NULL,
  `observacao` varchar(255) NOT NULL,
  `empresa_id` int(10) UNSIGNED DEFAULT NULL,
  `altura` varchar(10) NOT NULL,
  `largura` varchar(10) NOT NULL,
  `etiquestas_por_linha` int(11) NOT NULL,
  `distancia_etiquetas_lateral` varchar(10) NOT NULL,
  `distancia_etiquetas_topo` varchar(10) NOT NULL,
  `quantidade_etiquetas` int(11) NOT NULL,
  `tamanho_fonte` varchar(10) NOT NULL,
  `tamanho_codigo_barras` varchar(10) NOT NULL,
  `nome_empresa` tinyint(1) NOT NULL,
  `nome_produto` tinyint(1) NOT NULL,
  `valor_produto` tinyint(1) NOT NULL,
  `codigo_produto` tinyint(1) NOT NULL,
  `codigo_barras_numerico` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos`
--

CREATE TABLE `eventos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `logradouro` varchar(80) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `inicio` date NOT NULL,
  `fim` date NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `evento_funcionarios`
--

CREATE TABLE `evento_funcionarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `evento_id` int(10) UNSIGNED NOT NULL,
  `funcionario_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `evento_salarios`
--

CREATE TABLE `evento_salarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tipo` enum('semanal','mensal','anual') NOT NULL,
  `metodo` enum('informado','fixo') NOT NULL,
  `condicao` enum('soma','diminui') NOT NULL,
  `tipo_valor` enum('fixo','percentual') NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fatura_frente_caixas`
--

CREATE TABLE `fatura_frente_caixas` (
  `id` int(10) UNSIGNED NOT NULL,
  `venda_caixa_id` int(10) UNSIGNED NOT NULL,
  `valor` decimal(16,7) NOT NULL,
  `forma_pagamento` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `fatura_frente_caixas`
--

INSERT INTO `fatura_frente_caixas` (`id`, `venda_caixa_id`, `valor`, `forma_pagamento`, `created_at`, `updated_at`) VALUES
(1, 8, 15.0000000, '01', '2025-01-25 17:32:25', '2025-01-25 17:32:25'),
(2, 8, 15.0000000, '04', '2025-01-25 17:32:25', '2025-01-25 17:32:25');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fatura_orcamentos`
--

CREATE TABLE `fatura_orcamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `orcamento_id` int(10) UNSIGNED DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `vencimento` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fatura_pre_vendas`
--

CREATE TABLE `fatura_pre_vendas` (
  `id` int(10) UNSIGNED NOT NULL,
  `pre_venda_id` int(10) UNSIGNED NOT NULL,
  `valor` decimal(16,7) NOT NULL,
  `forma_pagamento` varchar(20) NOT NULL,
  `vencimento` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `filials`
--

CREATE TABLE `filials` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `razao_social` varchar(100) NOT NULL,
  `nome_fantasia` varchar(80) NOT NULL,
  `cnpj` varchar(19) NOT NULL,
  `ie` varchar(20) NOT NULL,
  `logradouro` varchar(80) NOT NULL,
  `complemento` varchar(100) NOT NULL DEFAULT '',
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `fone` varchar(20) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `pais` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `codPais` int(11) NOT NULL,
  `codMun` int(11) NOT NULL,
  `UF` char(2) NOT NULL,
  `nat_op_padrao` int(11) DEFAULT NULL,
  `ambiente` int(11) NOT NULL,
  `cUF` varchar(2) NOT NULL,
  `numero_serie_nfe` varchar(3) NOT NULL,
  `numero_serie_nfce` varchar(3) NOT NULL,
  `numero_serie_cte` varchar(3) NOT NULL,
  `numero_serie_mdfe` varchar(3) NOT NULL,
  `ultimo_numero_nfe` int(11) NOT NULL,
  `ultimo_numero_nfce` int(11) NOT NULL,
  `ultimo_numero_cte` int(11) NOT NULL,
  `ultimo_numero_mdfe` int(11) NOT NULL,
  `csc` varchar(60) NOT NULL,
  `csc_id` varchar(10) NOT NULL,
  `inscricao_municipal` varchar(25) DEFAULT NULL,
  `aut_xml` varchar(20) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `arquivo` blob DEFAULT NULL,
  `senha` varchar(30) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `financeiro_representantes`
--

CREATE TABLE `financeiro_representantes` (
  `id` int(10) UNSIGNED NOT NULL,
  `representante_empresa_id` int(10) UNSIGNED NOT NULL,
  `forma_pagamento` varchar(30) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `pagamento_comissao` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `forma_pagamentos`
--

CREATE TABLE `forma_pagamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED DEFAULT NULL,
  `nome` varchar(40) NOT NULL,
  `chave` varchar(30) NOT NULL,
  `taxa` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tipo_taxa` varchar(5) NOT NULL DEFAULT 'perc',
  `prazo_dias` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `infos` varchar(100) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `forma_pagamentos`
--

INSERT INTO `forma_pagamentos` (`id`, `empresa_id`, `nome`, `chave`, `taxa`, `tipo_taxa`, `prazo_dias`, `status`, `infos`, `created_at`, `updated_at`) VALUES
(1, 1, 'A vista', 'a_vista', 0.00, 'perc', 0, 1, '', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(2, 1, '30 dias', '30_dias', 0.00, 'perc', 30, 1, '', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(3, 1, 'Personalizado', 'personalizado', 0.00, 'perc', 0, 1, '', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(4, 1, 'Conta crediario', 'conta_crediario', 0.00, 'perc', 0, 1, '', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(5, 2, 'A vista', 'a_vista', 0.00, 'perc', 0, 1, '', '2025-01-25 17:03:00', '2025-01-25 17:03:00'),
(6, 2, '30 dias', '30_dias', 0.00, 'perc', 30, 1, '', '2025-01-25 17:03:00', '2025-01-25 17:03:00'),
(7, 2, 'Personalizado', 'personalizado', 0.00, 'perc', 0, 1, '', '2025-01-25 17:03:00', '2025-01-25 17:03:00'),
(8, 2, 'Conta crediario', 'conta_crediario', 0.00, 'perc', 0, 1, '', '2025-01-25 17:03:01', '2025-01-25 17:03:01'),
(9, 3, 'A vista', 'a_vista', 0.00, 'perc', 0, 1, '', '2025-02-07 00:28:13', '2025-02-07 00:28:13'),
(10, 3, '30 dias', '30_dias', 0.00, 'perc', 30, 1, '', '2025-02-07 00:28:14', '2025-02-07 00:28:14'),
(11, 3, 'Personalizado', 'personalizado', 0.00, 'perc', 0, 1, '', '2025-02-07 00:28:14', '2025-02-07 00:28:14'),
(12, 3, 'Conta crediario', 'conta_crediario', 0.00, 'perc', 0, 1, '', '2025-02-07 00:28:14', '2025-02-07 00:28:14');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedors`
--

CREATE TABLE `fornecedors` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `razao_social` varchar(100) NOT NULL,
  `nome_fantasia` varchar(80) NOT NULL,
  `cpf_cnpj` varchar(19) NOT NULL,
  `ie_rg` varchar(20) NOT NULL,
  `rua` varchar(80) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `contribuinte` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `fornecedors`
--

INSERT INTO `fornecedors` (`id`, `empresa_id`, `razao_social`, `nome_fantasia`, `cpf_cnpj`, `ie_rg`, `rua`, `numero`, `bairro`, `telefone`, `celular`, `email`, `cep`, `cidade_id`, `contribuinte`, `created_at`, `updated_at`) VALUES
(1, 1, 'Jonathan Crecencio', 'Jonathan Crecencio', '398.718.058-70', '', 'Avenida Antônio Emmerick', '448', 'Vila Cascatinha', '(13) 99154-8068', NULL, 'jonathancrecencio@outlook.com', '11390-000', 3837, 1, '2025-01-18 20:14:19', '2025-01-18 20:14:19');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fretes`
--

CREATE TABLE `fretes` (
  `id` int(10) UNSIGNED NOT NULL,
  `placa` varchar(9) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `tipo` int(11) NOT NULL,
  `qtdVolumes` int(11) NOT NULL,
  `numeracaoVolumes` varchar(20) NOT NULL,
  `especie` varchar(20) NOT NULL,
  `peso_liquido` decimal(8,3) NOT NULL,
  `peso_bruto` decimal(8,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionamento_deliveries`
--

CREATE TABLE `funcionamento_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `dia` varchar(255) NOT NULL,
  `inicio_expediente` varchar(5) NOT NULL,
  `fim_expediente` varchar(5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED DEFAULT NULL,
  `percentual_comissao` decimal(6,2) NOT NULL DEFAULT 0.00,
  `salario` decimal(10,2) NOT NULL DEFAULT 0.00,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `rg` varchar(15) NOT NULL,
  `rua` varchar(80) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `celular` varchar(20) NOT NULL DEFAULT '00 00000 0000',
  `email` varchar(40) NOT NULL DEFAULT 'null',
  `data_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `empresa_id`, `usuario_id`, `percentual_comissao`, `salario`, `nome`, `cpf`, `rg`, `rua`, `numero`, `bairro`, `cidade_id`, `telefone`, `celular`, `email`, `data_registro`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 33.33, 0.00, 'Gabrielle Freire Martins', '472.794.898-26', '456054716', 'R. Stelio Machado Loureiro', '682', 'Vila Fátima', 3837, '(13) 99156-4994', '(13) 99156-4994', 'gabriellefreiremartins@gmail.com', '2025-01-18', '2025-01-18 19:30:29', '2025-01-18 19:30:29'),
(2, 1, 2, 33.33, 0.00, 'Jonathan Crecencio', '398.718.058-70', '422643221', 'Avenida Antônio Emmerick', '448', 'Vila Cascatinha', 3837, '(13) 99154-8068', '(13) 99154-8068', 'jonathancrecencio@outlook.com', '2025-01-18', '2025-01-18 23:55:53', '2025-01-18 23:55:53'),
(3, 2, 6, 10.00, 1500.00, 'João Felipe das Neves', '147.258.369-00', '425863517', 'Avenida Antônio Emmerick', '448', 'Vila Cascatinha', 3837, '(13) 99999-9999', '(13) 99999-9999', 'teste@teste.com', '2025-01-25', '2025-01-25 17:56:54', '2025-01-25 17:56:54');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario_eventos`
--

CREATE TABLE `funcionario_eventos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `funcionario_id` int(10) UNSIGNED NOT NULL,
  `evento_id` bigint(20) UNSIGNED DEFAULT NULL,
  `condicao` enum('soma','diminui') NOT NULL,
  `metodo` enum('informado','fixo') NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario_os`
--

CREATE TABLE `funcionario_os` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `ordem_servico_id` int(10) UNSIGNED NOT NULL,
  `funcionario_id` int(10) UNSIGNED NOT NULL,
  `funcao` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `funcionario_os`
--

INSERT INTO `funcionario_os` (`id`, `usuario_id`, `ordem_servico_id`, `funcionario_id`, `funcao`, `created_at`, `updated_at`) VALUES
(3, 3, 4, 1, 'Diretora Financeira', '2025-01-18 22:28:21', '2025-01-18 22:28:21'),
(4, 3, 5, 1, 'Diretora Financeira', '2025-01-18 23:20:15', '2025-01-18 23:20:15'),
(5, 5, 9, 3, 'Vendedor(a)', '2025-01-25 18:16:36', '2025-01-25 18:16:36'),
(6, 2, 10, 1, 'Diretora Financeira', '2025-01-29 19:07:13', '2025-01-29 19:07:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupo_clientes`
--

CREATE TABLE `grupo_clientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagem_produto_ecommerces`
--

CREATE TABLE `imagem_produto_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `path` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagens_produto_deliveries`
--

CREATE TABLE `imagens_produto_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `path` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `informativo_ecommerces`
--

CREATE TABLE `informativo_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `info_descargas`
--

CREATE TABLE `info_descargas` (
  `id` int(10) UNSIGNED NOT NULL,
  `mdfe_id` int(10) UNSIGNED NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `tp_unid_transp` int(11) NOT NULL,
  `id_unid_transp` varchar(20) NOT NULL,
  `quantidade_rateio` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `inutiliza_nves`
--

CREATE TABLE `inutiliza_nves` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `numero_inicial` int(11) NOT NULL,
  `numero_final` int(11) NOT NULL,
  `justificativa` varchar(255) NOT NULL,
  `numero_serie` varchar(3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `inventarios`
--

CREATE TABLE `inventarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `inicio` date NOT NULL,
  `fim` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `referencia` varchar(30) NOT NULL,
  `observacao` varchar(255) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_agendamentos`
--

CREATE TABLE `item_agendamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `servico_id` int(10) UNSIGNED NOT NULL,
  `agendamento_id` int(10) UNSIGNED NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_compras`
--

CREATE TABLE `item_compras` (
  `id` int(10) UNSIGNED NOT NULL,
  `compra_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `valor_unitario` decimal(16,7) NOT NULL,
  `unidade_compra` varchar(10) NOT NULL,
  `validade` date DEFAULT NULL,
  `cfop_entrada` varchar(4) NOT NULL DEFAULT '',
  `codigo_siad` varchar(10) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_cotacaos`
--

CREATE TABLE `item_cotacaos` (
  `id` int(10) UNSIGNED NOT NULL,
  `cotacao_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_devolucaos`
--

CREATE TABLE `item_devolucaos` (
  `id` int(10) UNSIGNED NOT NULL,
  `cod` varchar(10) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `ncm` varchar(10) NOT NULL,
  `cfop` varchar(10) NOT NULL,
  `codBarras` varchar(13) NOT NULL,
  `valor_unit` decimal(14,4) NOT NULL,
  `quantidade` decimal(10,4) NOT NULL,
  `vDesc` decimal(12,4) NOT NULL,
  `item_parcial` tinyint(1) NOT NULL,
  `unidade_medida` varchar(8) NOT NULL,
  `cst_csosn` varchar(3) NOT NULL,
  `cst_pis` varchar(3) NOT NULL,
  `cst_cofins` varchar(3) NOT NULL,
  `cst_ipi` varchar(3) NOT NULL,
  `perc_icms` decimal(8,2) NOT NULL,
  `perc_pis` decimal(8,2) NOT NULL,
  `perc_cofins` decimal(8,2) NOT NULL,
  `perc_ipi` decimal(8,2) NOT NULL,
  `pRedBC` decimal(8,2) NOT NULL,
  `vBCSTRet` decimal(8,2) NOT NULL DEFAULT 0.00,
  `vFrete` decimal(8,2) NOT NULL DEFAULT 0.00,
  `devolucao_id` int(10) UNSIGNED NOT NULL,
  `modBCST` decimal(8,2) NOT NULL,
  `vBCST` decimal(8,2) NOT NULL,
  `pICMSST` decimal(8,2) NOT NULL,
  `vICMSST` decimal(8,2) NOT NULL,
  `pMVAST` decimal(8,2) NOT NULL,
  `orig` int(11) NOT NULL,
  `pST` decimal(10,2) NOT NULL,
  `vICMSSubstituto` decimal(10,2) NOT NULL,
  `vICMSSTRet` decimal(10,2) NOT NULL,
  `codigo_anp` varchar(10) NOT NULL DEFAULT '',
  `descricao_anp` varchar(95) NOT NULL DEFAULT '',
  `perc_glp` decimal(5,2) NOT NULL DEFAULT 0.00,
  `perc_gnn` decimal(5,2) NOT NULL DEFAULT 0.00,
  `perc_gni` decimal(5,2) NOT NULL DEFAULT 0.00,
  `uf_cons` varchar(2) NOT NULL DEFAULT '',
  `valor_partida` decimal(10,2) NOT NULL DEFAULT 0.00,
  `unidade_tributavel` varchar(4) NOT NULL DEFAULT '',
  `quantidade_tributavel` decimal(10,2) NOT NULL DEFAULT 0.00,
  `CEST` varchar(10) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_dves`
--

CREATE TABLE `item_dves` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `numero_nfe` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_inventarios`
--

CREATE TABLE `item_inventarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `inventario_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `observacao` varchar(100) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_i_b_t_es`
--

CREATE TABLE `item_i_b_t_es` (
  `id` int(10) UNSIGNED NOT NULL,
  `ibte_id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(8) NOT NULL,
  `descricao` varchar(80) NOT NULL,
  `nacional_federal` decimal(5,2) NOT NULL,
  `importado_federal` decimal(5,2) NOT NULL,
  `estadual` decimal(5,2) NOT NULL,
  `municipal` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_locacaos`
--

CREATE TABLE `item_locacaos` (
  `id` int(10) UNSIGNED NOT NULL,
  `locacao_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `observacao` varchar(50) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_locacao_disponibilidades`
--

CREATE TABLE `item_locacao_disponibilidades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `data` date NOT NULL,
  `locacao_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_orcamentos`
--

CREATE TABLE `item_orcamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `orcamento_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `valor` decimal(16,7) NOT NULL,
  `altura` decimal(10,2) NOT NULL,
  `largura` decimal(10,2) NOT NULL,
  `profundidade` decimal(10,2) NOT NULL,
  `acrescimo_perca` decimal(10,2) NOT NULL,
  `esquerda` decimal(10,2) NOT NULL,
  `direita` decimal(10,2) NOT NULL,
  `inferior` decimal(10,2) NOT NULL,
  `superior` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `item_orcamentos`
--

INSERT INTO `item_orcamentos` (`id`, `orcamento_id`, `produto_id`, `quantidade`, `valor`, `altura`, `largura`, `profundidade`, `acrescimo_perca`, `esquerda`, `direita`, `inferior`, `superior`, `created_at`, `updated_at`) VALUES
(2, 2, 4, 35.00, 4.0000000, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2025-01-25 18:00:39', '2025-01-25 18:00:39');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pack_produto_deliveries`
--

CREATE TABLE `item_pack_produto_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_delivery_id` int(10) UNSIGNED DEFAULT NULL,
  `pack_id` int(10) UNSIGNED DEFAULT NULL,
  `quantidade` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedidos`
--

CREATE TABLE `item_pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(10) UNSIGNED NOT NULL,
  `tamanho_pizza_id` int(10) UNSIGNED DEFAULT NULL,
  `observacao` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `impresso` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `item_pedidos`
--

INSERT INTO `item_pedidos` (`id`, `produto_id`, `pedido_id`, `tamanho_pizza_id`, `observacao`, `status`, `quantidade`, `valor`, `impresso`, `created_at`, `updated_at`) VALUES
(1, 1, 3, NULL, '', 1, 1.00, 2400.00, 0, '2025-01-19 03:10:31', '2025-01-19 03:10:31'),
(3, 1, 5, NULL, '', 0, 1.00, 2400.00, 0, '2025-01-19 03:19:45', '2025-01-19 03:19:45'),
(4, 4, 7, NULL, '', 1, 1.00, 4.00, 0, '2025-01-25 18:58:26', '2025-01-25 18:58:42'),
(5, 1, 9, NULL, '', 1, 1.00, 2400.00, 0, '2025-01-29 18:29:12', '2025-01-29 18:29:35'),
(6, 5, 10, NULL, '', 1, 2.00, 22.00, 0, '2025-01-29 18:50:24', '2025-01-29 18:50:31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido_complemento_deliveries`
--

CREATE TABLE `item_pedido_complemento_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_pedido_id` int(10) UNSIGNED NOT NULL,
  `complemento_id` int(10) UNSIGNED NOT NULL,
  `quantidade` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido_complemento_locals`
--

CREATE TABLE `item_pedido_complemento_locals` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_pedido` int(10) UNSIGNED NOT NULL,
  `complemento_id` int(10) UNSIGNED NOT NULL,
  `quantidade` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido_deliveries`
--

CREATE TABLE `item_pedido_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `observacao` varchar(50) NOT NULL,
  `valor` decimal(14,2) NOT NULL,
  `tamanho_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido_ecommerces`
--

CREATE TABLE `item_pedido_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `quantidade` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pizza_pedidos`
--

CREATE TABLE `item_pizza_pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_pedido` int(10) UNSIGNED NOT NULL,
  `sabor_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pizza_pedido_locals`
--

CREATE TABLE `item_pizza_pedido_locals` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_pedido` int(10) UNSIGNED NOT NULL,
  `sabor_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_receitas`
--

CREATE TABLE `item_receitas` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED DEFAULT NULL,
  `receita_id` int(10) UNSIGNED DEFAULT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `medida` varchar(8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_remessa_nves`
--

CREATE TABLE `item_remessa_nves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `remessa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `quantidade` decimal(16,7) NOT NULL,
  `valor_unitario` decimal(16,7) NOT NULL,
  `sub_total` decimal(16,7) NOT NULL,
  `cfop` varchar(4) NOT NULL,
  `cst_csosn` varchar(3) NOT NULL,
  `cst_pis` varchar(3) NOT NULL,
  `cst_cofins` varchar(3) NOT NULL,
  `cst_ipi` varchar(3) NOT NULL,
  `perc_icms` decimal(8,2) NOT NULL,
  `perc_pis` decimal(8,2) NOT NULL,
  `perc_cofins` decimal(8,2) NOT NULL,
  `perc_ipi` decimal(8,2) NOT NULL,
  `pRedBC` decimal(10,4) NOT NULL,
  `vbc_icms` decimal(10,4) NOT NULL,
  `vbc_pis` decimal(10,4) NOT NULL,
  `vbc_cofins` decimal(10,4) NOT NULL,
  `vbc_ipi` decimal(10,4) NOT NULL,
  `valor_icms` decimal(10,4) NOT NULL,
  `valor_pis` decimal(10,4) NOT NULL,
  `valor_cofins` decimal(10,4) NOT NULL,
  `valor_ipi` decimal(10,4) NOT NULL,
  `vBCSTRet` decimal(8,2) NOT NULL DEFAULT 0.00,
  `vFrete` decimal(8,2) NOT NULL DEFAULT 0.00,
  `modBCST` decimal(8,2) NOT NULL,
  `vBCST` decimal(8,2) NOT NULL,
  `pICMSST` decimal(8,2) NOT NULL,
  `vICMSST` decimal(8,2) NOT NULL,
  `pMVAST` decimal(8,2) NOT NULL,
  `x_pedido` varchar(30) NOT NULL,
  `num_item_pedido` varchar(30) NOT NULL,
  `cest` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_vendas`
--

CREATE TABLE `item_vendas` (
  `id` int(10) UNSIGNED NOT NULL,
  `venda_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `quantidade_dimensao` decimal(10,3) NOT NULL DEFAULT 1.000,
  `valor` decimal(16,7) NOT NULL,
  `valor_custo` decimal(16,7) NOT NULL DEFAULT 0.0000000,
  `cfop` int(11) NOT NULL DEFAULT 0,
  `altura` decimal(10,2) DEFAULT NULL,
  `largura` decimal(10,2) DEFAULT NULL,
  `profundidade` decimal(10,2) DEFAULT NULL,
  `acrescimo_perca` decimal(10,2) DEFAULT NULL,
  `esquerda` decimal(10,2) DEFAULT NULL,
  `direita` decimal(10,2) DEFAULT NULL,
  `inferior` decimal(10,2) DEFAULT NULL,
  `superior` decimal(10,2) DEFAULT NULL,
  `x_pedido` varchar(30) DEFAULT NULL,
  `num_item_pedido` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `item_vendas`
--

INSERT INTO `item_vendas` (`id`, `venda_id`, `produto_id`, `quantidade`, `quantidade_dimensao`, `valor`, `valor_custo`, `cfop`, `altura`, `largura`, `profundidade`, `acrescimo_perca`, `esquerda`, `direita`, `inferior`, `superior`, `x_pedido`, `num_item_pedido`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 1.000, 1.000, 2400.0000000, 40.0000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-18 19:48:30', '2025-01-18 19:48:30'),
(3, 2, 1, 1.000, 1.000, 2400.0000000, 40.0000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-18 19:52:09', '2025-01-18 19:52:09'),
(4, 3, 1, 1.000, 1.000, 2400.0000000, 40.0000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-18 20:16:46', '2025-01-18 20:16:46'),
(5, 4, 1, 1.000, 1.000, 2400.0000000, 40.0000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-18 23:37:10', '2025-01-18 23:37:10'),
(6, 5, 1, 1.000, 1.000, 2400.0000000, 40.0000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-18 23:39:02', '2025-01-18 23:39:02'),
(7, 6, 1, 1.000, 1.000, 2400.0000000, 40.0000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-18 23:45:12', '2025-01-18 23:45:12'),
(8, 7, 3, 1.000, 1.000, 48.9000000, 15.0000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-19 03:22:55', '2025-01-19 03:22:55'),
(10, 8, 1, 1.000, 1.000, 2400.0000000, 40.0000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-25 18:08:22', '2025-01-25 18:08:22'),
(11, 9, 4, 35.000, 1.000, 4.0000000, 1.5000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-25 18:09:45', '2025-01-25 18:09:45');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_venda_caixas`
--

CREATE TABLE `item_venda_caixas` (
  `id` int(10) UNSIGNED NOT NULL,
  `venda_caixa_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `item_pedido_id` int(10) UNSIGNED DEFAULT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `valor` decimal(16,7) NOT NULL,
  `valor_custo` decimal(16,7) NOT NULL DEFAULT 0.0000000,
  `observacao` varchar(80) NOT NULL,
  `cfop` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `item_venda_caixas`
--

INSERT INTO `item_venda_caixas` (`id`, `venda_caixa_id`, `produto_id`, `item_pedido_id`, `quantidade`, `valor`, `valor_custo`, `observacao`, `cfop`, `created_at`, `updated_at`) VALUES
(4, 4, 1, NULL, 1.000, 2400.0000000, 40.0000000, '', 0, '2025-01-18 21:21:57', '2025-01-18 21:21:57'),
(5, 5, 1, NULL, 1.000, 2400.0000000, 40.0000000, '', 0, '2025-01-18 21:22:30', '2025-01-18 21:22:30'),
(6, 6, 1, NULL, 1.000, 2400.0000000, 40.0000000, '', 0, '2025-01-19 03:11:36', '2025-01-19 03:11:36'),
(7, 7, 1, NULL, 1.000, 2400.0000000, 40.0000000, '', 0, '2025-01-19 03:16:13', '2025-01-19 03:16:13'),
(8, 8, 4, NULL, 8.000, 4.0000000, 1.5000000, '', 0, '2025-01-25 17:32:25', '2025-01-25 17:32:25'),
(9, 9, 1, NULL, 1.000, 2400.0000000, 40.0000000, '', 0, '2025-01-25 17:36:30', '2025-01-25 17:36:30'),
(10, 10, 1, NULL, 1.000, 2400.0000000, 40.0000000, '', 0, '2025-01-25 17:39:20', '2025-01-25 17:39:20'),
(11, 11, 1, NULL, 1.000, 2400.0000000, 40.0000000, '', 0, '2025-01-25 17:48:59', '2025-01-25 17:48:59'),
(12, 12, 4, NULL, 50.000, 4.0000000, 1.5000000, '', 0, '2025-01-25 17:51:55', '2025-01-25 17:51:55'),
(13, 13, 1, NULL, 1.000, 2400.0000000, 40.0000000, '', 0, '2025-01-25 18:06:11', '2025-01-25 18:06:11'),
(14, 14, 4, NULL, 1.000, 4.0000000, 1.5000000, '', 0, '2025-01-25 18:11:52', '2025-01-25 18:11:52'),
(15, 15, 4, NULL, 35.000, 4.0000000, 1.5000000, '', 0, '2025-01-25 18:42:36', '2025-01-25 18:42:36'),
(16, 16, 4, NULL, 2.000, 4.0000000, 1.5000000, '', 0, '2025-01-25 18:48:13', '2025-01-25 18:48:13'),
(17, 17, 4, NULL, 1.000, 4.0000000, 1.5000000, '', 0, '2025-01-25 18:49:19', '2025-01-25 18:49:19'),
(18, 18, 4, NULL, 1.000, 4.0000000, 1.5000000, '', 0, '2025-01-25 18:50:03', '2025-01-25 18:50:03'),
(19, 19, 4, NULL, 1.000, 4.0000000, 1.5000000, '', 0, '2025-01-25 19:00:45', '2025-01-25 19:00:45'),
(20, 20, 1, NULL, 1.000, 2400.0000000, 40.0000000, '', 0, '2025-01-29 18:30:37', '2025-01-29 18:30:37'),
(21, 21, 5, NULL, 3.000, 22.0000000, 20.0000000, '', 0, '2025-01-29 18:52:31', '2025-01-29 18:52:31'),
(22, 21, 3, NULL, 3.000, 48.9000000, 15.0000000, '', 0, '2025-01-29 18:52:31', '2025-01-29 18:52:31'),
(23, 22, 5, NULL, 1.000, 22.0000000, 20.0000000, '', 0, '2025-01-29 18:58:32', '2025-01-29 18:58:32'),
(24, 23, 5, NULL, 1.000, 22.0000000, 20.0000000, '', 0, '2025-01-29 18:59:31', '2025-01-29 18:59:31'),
(25, 24, 5, NULL, 1.000, 22.0000000, 20.0000000, '', 0, '2025-01-29 19:00:33', '2025-01-29 19:00:33'),
(26, 25, 5, NULL, 1.000, 22.0000000, 20.0000000, '', 0, '2025-01-29 19:01:36', '2025-01-29 19:01:36');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_venda_caixa_pre_vendas`
--

CREATE TABLE `item_venda_caixa_pre_vendas` (
  `id` int(10) UNSIGNED NOT NULL,
  `pre_venda_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `valor` decimal(16,7) NOT NULL,
  `observacao` varchar(80) NOT NULL,
  `cfop` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `item_venda_caixa_pre_vendas`
--

INSERT INTO `item_venda_caixa_pre_vendas` (`id`, `pre_venda_id`, `produto_id`, `quantidade`, `valor`, `observacao`, `cfop`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 1.000, 4.0000000, '', 0, '2025-01-25 18:10:44', '2025-01-25 18:10:44'),
(2, 2, 4, 35.000, 4.0000000, '', 0, '2025-01-25 18:40:09', '2025-01-25 18:40:09'),
(3, 3, 4, 1.000, 4.0000000, '', 0, '2025-01-25 18:46:14', '2025-01-25 18:46:14'),
(4, 4, 4, 2.000, 4.0000000, '', 0, '2025-01-25 18:47:10', '2025-01-25 18:47:10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `i_b_p_ts`
--

CREATE TABLE `i_b_p_ts` (
  `id` int(10) UNSIGNED NOT NULL,
  `uf` varchar(2) NOT NULL,
  `versao` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `lacre_transportes`
--

CREATE TABLE `lacre_transportes` (
  `id` int(10) UNSIGNED NOT NULL,
  `info_id` int(10) UNSIGNED NOT NULL,
  `numero` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `lacre_unidade_cargas`
--

CREATE TABLE `lacre_unidade_cargas` (
  `id` int(10) UNSIGNED NOT NULL,
  `info_id` int(10) UNSIGNED NOT NULL,
  `numero` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `lancamento_categorias`
--

CREATE TABLE `lancamento_categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `percentual` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `lista_complemento_deliveries`
--

CREATE TABLE `lista_complemento_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `complemento_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `lista_precos`
--

CREATE TABLE `lista_precos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(40) NOT NULL,
  `tipo` int(11) NOT NULL,
  `tipo_inc_red` int(11) NOT NULL,
  `percentual_alteracao` decimal(4,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `locacaos`
--

CREATE TABLE `locacaos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `inicio` date NOT NULL,
  `fim` date NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `observacao` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `manifesta_ctes`
--

CREATE TABLE `manifesta_ctes` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `chave` varchar(44) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_emissao` varchar(25) NOT NULL,
  `sequencia_evento` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `manifesta_dves`
--

CREATE TABLE `manifesta_dves` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `chave` varchar(44) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `num_prot` varchar(20) NOT NULL,
  `data_emissao` varchar(25) NOT NULL,
  `sequencia_evento` int(11) NOT NULL,
  `fatura_salva` tinyint(1) NOT NULL,
  `devolucao` tinyint(1) NOT NULL,
  `tipo` int(11) NOT NULL,
  `nsu` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `nNf` int(11) NOT NULL DEFAULT 0,
  `filial_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `manifesto_dias`
--

CREATE TABLE `manifesto_dias` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `marcas`
--

CREATE TABLE `marcas` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `marcas`
--

INSERT INTO `marcas` (`id`, `empresa_id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 1, 'HT Company', '2025-01-18 19:37:46', '2025-01-29 18:40:55'),
(2, 2, 'Kibon', '2025-01-25 17:19:58', '2025-01-25 17:19:58'),
(3, 1, 'AÇAI AH GAROTO', '2025-01-29 18:44:59', '2025-01-29 18:44:59');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mdves`
--

CREATE TABLE `mdves` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `filial_id` int(10) UNSIGNED DEFAULT NULL,
  `uf_inicio` varchar(2) NOT NULL,
  `uf_fim` varchar(2) NOT NULL,
  `encerrado` tinyint(1) NOT NULL,
  `data_inicio_viagem` date NOT NULL,
  `carga_posterior` tinyint(1) NOT NULL,
  `cnpj_contratante` varchar(18) NOT NULL,
  `veiculo_tracao_id` int(10) UNSIGNED NOT NULL,
  `veiculo_reboque_id` int(10) UNSIGNED DEFAULT NULL,
  `veiculo_reboque2_id` int(10) UNSIGNED DEFAULT NULL,
  `veiculo_reboque3_id` int(10) UNSIGNED DEFAULT NULL,
  `estado_emissao` enum('novo','aprovado','rejeitado','cancelado') NOT NULL,
  `mdfe_numero` int(11) NOT NULL,
  `chave` varchar(44) NOT NULL,
  `protocolo` varchar(16) NOT NULL,
  `seguradora_nome` varchar(30) NOT NULL,
  `seguradora_cnpj` varchar(18) NOT NULL,
  `numero_apolice` varchar(15) NOT NULL,
  `numero_averbacao` varchar(40) NOT NULL,
  `valor_carga` decimal(10,2) NOT NULL,
  `quantidade_carga` decimal(10,4) NOT NULL,
  `info_complementar` varchar(60) NOT NULL,
  `info_adicional_fisco` varchar(60) NOT NULL,
  `condutor_nome` varchar(60) NOT NULL,
  `condutor_cpf` varchar(15) NOT NULL,
  `lac_rodo` varchar(8) NOT NULL,
  `tp_emit` int(11) NOT NULL,
  `tp_transp` int(11) NOT NULL,
  `produto_pred_nome` varchar(50) NOT NULL,
  `produto_pred_ncm` varchar(8) NOT NULL,
  `produto_pred_cod_barras` varchar(13) NOT NULL,
  `cep_carrega` varchar(8) NOT NULL,
  `cep_descarrega` varchar(8) NOT NULL,
  `tp_carga` varchar(2) NOT NULL,
  `latitude_carregamento` varchar(15) NOT NULL,
  `longitude_carregamento` varchar(15) NOT NULL,
  `latitude_descarregamento` varchar(15) NOT NULL,
  `longitude_descarregamento` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `medida_ctes`
--

CREATE TABLE `medida_ctes` (
  `id` int(10) UNSIGNED NOT NULL,
  `cod_unidade` varchar(2) NOT NULL,
  `tipo_medida` varchar(20) NOT NULL,
  `quantidade_carga` decimal(10,4) NOT NULL,
  `cte_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mercado_configs`
--

CREATE TABLE `mercado_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(50) NOT NULL,
  `funcionamento` varchar(100) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `total_de_produtos` int(11) NOT NULL,
  `total_de_clientes` int(11) NOT NULL,
  `total_de_funcionarios` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mesas`
--

CREATE TABLE `mesas` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(15) NOT NULL,
  `token` varchar(25) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `mesas`
--

INSERT INTO `mesas` (`id`, `empresa_id`, `nome`, `token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mesa 1', 'vk4BJGAaFQT8yhDVB4hRQiOyc', '2025-01-19 01:44:04', '2025-01-19 01:44:04'),
(2, 1, 'Mesa 2', '1XrVTtFgQv8b2qNdqXP2jfEHK', '2025-01-19 01:44:13', '2025-01-19 01:44:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2012_02_05_224101_create_cidades_table', 1),
(2, '2013_11_16_155516_create_empresas_table', 1),
(3, '2013_11_17_155930_create_filials_table', 1),
(4, '2014_10_12_000000_create_users_table', 1),
(5, '2014_10_12_000000_create_usuario_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2019_01_14_173256_create_categoria_contas_table', 1),
(8, '2019_01_14_173257_create_marcas_table', 1),
(9, '2019_02_10_132730_create_categorias_table', 1),
(10, '2019_02_10_132731_create_sub_categorias_table', 1),
(11, '2019_02_10_170842_create_produtos_table', 1),
(12, '2019_02_10_182200_create_clientes_table', 1),
(13, '2019_02_11_003750_create_fornecedores_table', 1),
(14, '2019_02_12_124328_create_transportadoras_table', 1),
(15, '2019_02_13_025957_create_ordem_servico_table', 1),
(16, '2019_02_13_043706_create_compras_table', 1),
(17, '2019_02_13_043951_create_item_compra_table', 1),
(18, '2019_02_13_212540_create_estoque_table', 1),
(19, '2019_07_18_130534_create_cidade_deliveries_table', 1),
(20, '2019_08_19_000000_create_failed_jobs_table', 1),
(21, '2019_09_06_132659_create_natureza_operacaos_table', 1),
(22, '2019_09_06_233629_create_fretes_table', 1),
(23, '2019_09_07_000028_create_funcionarios_table', 1),
(24, '2019_09_07_000243_create_contato_funcionarios_table', 1),
(25, '2019_09_07_000401_create_vendas_table', 1),
(26, '2019_09_07_000402_create_orcamentos_table', 1),
(27, '2019_09_07_000602_create_item_vendas_table', 1),
(28, '2019_09_07_000603_create_item_orcamentos_table', 1),
(29, '2019_09_07_001421_create_categoria_servicos_table', 1),
(30, '2019_09_07_001450_create_servicos_table', 1),
(31, '2019_09_07_001649_create_servico_os_table', 1),
(32, '2019_09_09_060514_create_relatorio_os_table', 1),
(33, '2019_09_10_120640_create_funcionario_os_table', 1),
(34, '2019_09_13_124343_create_conta_pagars_table', 1),
(35, '2019_09_16_133536_create_receitas_table', 1),
(36, '2019_09_16_134008_create_item_receitas_table', 1),
(37, '2019_09_17_104549_create_apontamentos_table', 1),
(38, '2019_09_18_120307_create_config_notas_table', 1),
(39, '2019_09_19_190012_create_credito_vendas_table', 1),
(40, '2019_09_19_201804_create_venda_caixas_table', 1),
(41, '2019_09_20_072219_create_conta_recebers_table', 1),
(42, '2019_09_25_221701_create_escritorio_contabils_table', 1),
(43, '2019_09_27_201839_create_sangria_caixas_table', 1),
(44, '2019_09_27_202513_create_abertura_caixas_table', 1),
(45, '2019_10_08_020219_create_cotacaos_table', 1),
(46, '2019_10_08_020521_create_item_cotacaos_table', 1),
(47, '2019_11_18_142053_create_cliente_deliveries_table', 1),
(48, '2019_11_18_173451_create_categoria_produto_deliveries_table', 1),
(49, '2019_11_18_173545_create_endereco_deliveries_table', 1),
(50, '2019_11_18_174144_create_delivery_configs_table', 1),
(51, '2019_11_18_174210_create_tamanho_pizzas_table', 1),
(52, '2019_11_18_174216_create_produto_deliveries_table', 1),
(53, '2019_11_18_174216_create_produto_pizzas_table', 1),
(54, '2019_11_18_174238_create_codigo_descontos_table', 1),
(55, '2019_11_18_174240_create_pedido_deliveries_table', 1),
(56, '2019_11_18_174253_create_item_pedido_deliveries_table', 1),
(57, '2019_11_18_174254_create_item_pizza_pedidos_table', 1),
(58, '2019_11_18_182024_create_imagens_produto_deliveries_table', 1),
(59, '2019_11_18_182201_create_funcionamento_deliveries_table', 1),
(60, '2019_11_25_114233_create_complemento_deliveries_table', 1),
(61, '2019_11_25_115042_create_lista_complemento_deliveries_table', 1),
(62, '2019_11_25_115947_create_item_pedido_complemento_deliveries_table', 1),
(63, '2019_12_12_113546_create_veiculos_table', 1),
(64, '2019_12_12_113547_create_ctes_table', 1),
(65, '2019_12_12_113840_create_medida_ctes_table', 1),
(66, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(67, '2019_12_14_232910_create_componente_ctes_table', 1),
(68, '2019_12_19_184011_create_produto_favorito_deliveries_table', 1),
(69, '2019_12_24_105307_create_tributacaos_table', 1),
(70, '2019_12_27_081743_create_token_cliente_deliveries_table', 1),
(71, '2020_01_03_003420_create_mesas_table', 1),
(72, '2020_01_03_121157_create_certificados_table', 1),
(73, '2020_01_04_003419_create_bairro_deliveries_table', 1),
(74, '2020_01_04_003419_create_pushes_table', 1),
(75, '2020_01_04_003420_create_pedidos_table', 1),
(76, '2020_01_04_003421_create_item_pedidos_table', 1),
(77, '2020_01_04_003422_create_item_venda_caixas_table', 1),
(78, '2020_01_18_084439_create_item_pizza_pedido_locals_table', 1),
(79, '2020_01_19_003305_create_item_pedido_complemento_locals_table', 1),
(80, '2020_01_19_201036_create_categoria_despesa_ctes_table', 1),
(81, '2020_01_19_201358_create_despesa_ctes_table', 1),
(82, '2020_01_20_004105_create_receita_ctes_table', 1),
(83, '2020_02_26_100343_create_token_webs_table', 1),
(84, '2020_02_27_182503_create_devolucaos_table', 1),
(85, '2020_02_27_182519_create_item_devolucaos_table', 1),
(86, '2020_03_01_085359_create_mdves_table', 1),
(87, '2020_03_02_205916_create_municipio_carregamentos_table', 1),
(88, '2020_03_02_205937_create_percursos_table', 1),
(89, '2020_03_03_080744_create_ciots_table', 1),
(90, '2020_03_03_080847_create_vale_pedagios_table', 1),
(91, '2020_03_03_081000_create_info_descargas_table', 1),
(92, '2020_03_03_081214_create_n_fe_descargas_table', 1),
(93, '2020_03_03_081236_create_c_te_descargas_table', 1),
(94, '2020_03_03_081412_create_lacre_unidade_cargas_table', 1),
(95, '2020_03_03_081444_create_unidade_cargas_table', 1),
(96, '2020_03_03_081503_create_lacre_transportes_table', 1),
(97, '2020_05_16_002118_create_manifesta_dves_table', 1),
(98, '2020_05_29_164157_create_pedido_pag_seguros_table', 1),
(99, '2020_06_18_133755_create_pedido_deletes_table', 1),
(100, '2020_06_23_095357_create_pack_produto_deliveries_table', 1),
(101, '2020_06_23_095512_create_item_pack_produto_deliveries_table', 1),
(102, '2020_06_24_093940_create_mercado_configs_table', 1),
(103, '2020_06_24_095935_create_banner_mais_vendidos_table', 1),
(104, '2020_06_24_095959_create_banner_topos_table', 1),
(105, '2020_07_06_155337_create_fatura_orcamentos_table', 1),
(106, '2020_08_05_073712_create_lista_precos_table', 1),
(107, '2020_08_05_074304_create_produto_lista_precos_table', 1),
(108, '2020_08_19_094151_create_alteracao_estoques_table', 1),
(109, '2020_09_09_084728_create_pedido_qr_code_clientes_table', 1),
(110, '2020_09_09_103043_create_item_dves_table', 1),
(111, '2020_11_18_090220_create_manifesto_dias_table', 1),
(112, '2020_11_19_165948_create_planos_table', 1),
(113, '2020_11_19_170422_create_plano_empresas_table', 1),
(114, '2020_11_22_171953_create_motoboys_table', 1),
(115, '2020_11_22_172042_create_pedido_motoboys_table', 1),
(116, '2020_11_24_081612_create_comissao_vendas_table', 1),
(117, '2020_11_26_081725_create_suprimento_caixas_table', 1),
(118, '2021_01_24_132506_create_agendamentos_table', 1),
(119, '2021_01_24_133704_create_item_agendamentos_table', 1),
(120, '2021_02_11_080228_create_eventos_table', 1),
(121, '2021_02_11_080515_create_atividade_eventos_table', 1),
(122, '2021_02_11_080603_create_atividade_servicos_table', 1),
(123, '2021_02_11_080623_create_evento_funcionarios_table', 1),
(124, '2021_02_22_082321_create_i_b_p_ts_table', 1),
(125, '2021_02_22_082653_create_item_i_b_t_es_table', 1),
(126, '2021_03_19_200350_create_categoria_master_deliveries_table', 1),
(127, '2021_03_19_200648_create_categoria_empresas_table', 1),
(128, '2021_03_21_082453_create_destaque_delivery_masters_table', 1),
(129, '2021_03_21_082748_create_categoria_destaque_master_deliveries_table', 1),
(130, '2021_03_21_082819_create_produto_destaque_master_deliveries_table', 1),
(131, '2021_03_25_082503_create_contratos_table', 1),
(132, '2021_03_25_091702_create_empresa_contratos_table', 1),
(133, '2021_03_26_071546_create_pais_table', 1),
(134, '2021_04_05_233318_create_dres_table', 1),
(135, '2021_04_05_233348_create_dre_categorias_table', 1),
(136, '2021_04_05_233404_create_lancamento_categorias_table', 1),
(137, '2021_04_16_084824_create_perfil_acessos_table', 1),
(138, '2021_04_17_095839_create_payments_table', 1),
(139, '2021_04_23_103751_create_conta_bancarias_table', 1),
(140, '2021_04_24_103713_create_boletos_table', 1),
(141, '2021_04_27_100435_create_remessas_table', 1),
(142, '2021_04_27_100452_create_remessa_boletos_table', 1),
(143, '2021_05_13_141220_create_cte_os_table', 1),
(144, '2021_05_22_144019_create_divisao_grades_table', 1),
(145, '2021_05_25_081708_create_config_ecommerces_table', 1),
(146, '2021_05_25_101521_create_categoria_produto_ecommerces_table', 1),
(147, '2021_05_25_120757_create_produto_ecommerces_table', 1),
(148, '2021_05_25_145624_create_imagem_produto_ecommerces_table', 1),
(149, '2021_05_27_080321_create_carrossel_ecommerces_table', 1),
(150, '2021_05_29_132316_create_autor_post_blog_ecommerces_table', 1),
(151, '2021_05_30_132128_create_categoria_post_blog_ecommerces_table', 1),
(152, '2021_05_30_132159_create_post_blog_ecommerces_table', 1),
(153, '2021_05_31_093149_create_contato_ecommerces_table', 1),
(154, '2021_05_31_130340_create_informativo_ecommerces_table', 1),
(155, '2021_05_31_163515_create_cliente_ecommerces_table', 1),
(156, '2021_05_31_163527_create_endereco_ecommerces_table', 1),
(157, '2021_05_31_163540_create_pedido_ecommerces_table', 1),
(158, '2021_05_31_163542_create_item_pedido_ecommerces_table', 1),
(159, '2021_06_01_144411_create_grupo_clientes_table', 1),
(160, '2021_06_13_102109_create_usuario_acessos_table', 1),
(161, '2021_06_19_132023_create_curtida_produto_ecommerces_table', 1),
(162, '2021_07_12_191004_create_acessors_table', 1),
(163, '2021_07_28_000256_create_config_caixas_table', 1),
(164, '2021_08_10_175450_create_representantes_table', 1),
(165, '2021_08_10_175506_create_representante_empresas_table', 1),
(166, '2021_08_10_175521_create_financeiro_representantes_table', 1),
(167, '2021_09_08_153601_create_locacaos_table', 1),
(168, '2021_09_08_153614_create_item_locacaos_table', 1),
(169, '2021_09_21_151459_create_tela_pedidos_table', 1),
(170, '2021_10_28_133507_create_n_fe_referecias_table', 1),
(171, '2021_10_28_164744_create_tributacao_ufs_table', 1),
(172, '2021_11_30_123253_create_sub_categoria_ecommerces_table', 1),
(173, '2021_12_01_155835_create_manifesta_ctes_table', 1),
(174, '2021_12_03_135527_create_compra_referencias_table', 1),
(175, '2021_12_03_142706_create_inventarios_table', 1),
(176, '2021_12_03_142722_create_item_inventarios_table', 1),
(177, '2021_12_12_094702_create_fatura_frente_caixas_table', 1),
(178, '2021_12_27_105057_create_etiquetas_table', 1),
(179, '2022_01_01_124019_create_forma_pagamentos_table', 1),
(180, '2022_03_08_124221_create_tickets_table', 1),
(181, '2022_03_08_124507_create_ticket_mensagems_table', 1),
(182, '2022_04_01_140714_create_movimentacao_finaneiras_table', 1),
(183, '2022_05_25_103117_create_nuvem_shop_configs_table', 1),
(184, '2022_05_27_173417_create_nuvem_shop_pedidos_table', 1),
(185, '2022_05_27_173911_create_nuvem_shop_item_pedidos_table', 1),
(186, '2022_06_16_131558_create_categoria_loja_segmentos_table', 1),
(187, '2022_06_20_195013_create_contadors_table', 1),
(188, '2022_07_03_153624_create_produto_ibpts_table', 1),
(189, '2023_02_21_165410_create_erro_logs_table', 1),
(190, '2023_03_13_094007_create_inutiliza_nves_table', 1),
(191, '2023_03_13_102642_create_tema_usuarios_table', 1),
(192, '2023_03_13_105907_create_record_logs_table', 1),
(193, '2023_03_26_083219_create_chave_nfe_ctes_table', 1),
(194, '2023_05_01_153008_create_plano_empresa_representantes_table', 1),
(195, '2023_05_01_161429_create_pesquisas_table', 1),
(196, '2023_05_02_081350_create_troca_vendas_table', 1),
(197, '2023_05_02_081625_create_troca_venda_items_table', 1),
(198, '2023_05_02_135829_create_alertas_table', 1),
(199, '2023_05_02_161835_create_system_updates_table', 1),
(200, '2023_05_03_081129_create_troca_venda_caixas_table', 1),
(201, '2023_05_26_152826_create_venda_caixa_pre_vendas_table', 1),
(202, '2023_05_29_101650_create_item_venda_caixa_pre_vendas_table', 1),
(203, '2023_05_29_102747_create_fatura_pre_vendas_table', 1),
(204, '2023_06_09_100953_create_destaque_deliveries_table', 1),
(205, '2023_06_12_114708_create_bairro_delivery_lojas_table', 1),
(206, '2023_07_31_152556_create_carrossel_deliveries_table', 1),
(207, '2023_08_01_142508_create_delivery_config_galerias_table', 1),
(208, '2023_08_07_174641_create_nfses_table', 1),
(209, '2023_08_08_105318_create_nfse_servicos_table', 1),
(210, '2023_08_18_101441_create_contigencias_table', 1),
(211, '2023_08_25_164522_create_remessas_nves_table', 1),
(212, '2023_08_28_141605_create_remessa_nfe_faturas_table', 1),
(213, '2023_08_28_143723_create_item_remessa_nves_table', 1),
(214, '2023_08_28_143814_create_remessa_referencia_nves_table', 1),
(215, '2023_09_11_094936_create_evento_salarios_table', 1),
(216, '2023_09_11_113040_create_funcionario_eventos_table', 1),
(217, '2023_09_11_172803_create_apuracao_mensals_table', 1),
(218, '2023_09_12_091601_create_apuracao_salario_eventos_table', 1),
(219, '2023_09_12_180749_create_item_locacao_disponibilidades_table', 1),
(220, '2023_09_21_170655_create_apk_comandas_table', 1),
(221, '2023_09_26_161117_create_xml_enviados_table', 1),
(222, '2023_10_20_153918_create_video_ajudas_table', 1),
(223, '2023_11_06_230859_create_cupom_desconto_ecommerces_table', 1),
(224, '2024_06_13_151923_create_produto_os_table', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `motoboys`
--

CREATE TABLE `motoboys` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(60) NOT NULL,
  `telefone1` varchar(15) NOT NULL,
  `telefone2` varchar(15) NOT NULL,
  `telefone3` varchar(15) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `rg` varchar(15) NOT NULL,
  `endereco` varchar(60) NOT NULL,
  `tipo_transporte` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `movimentacao_finaneiras`
--

CREATE TABLE `movimentacao_finaneiras` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(100) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `municipio_carregamentos`
--

CREATE TABLE `municipio_carregamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `mdfe_id` int(10) UNSIGNED NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `natureza_operacaos`
--

CREATE TABLE `natureza_operacaos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `natureza` varchar(80) NOT NULL,
  `CFOP_entrada_estadual` varchar(5) NOT NULL DEFAULT '',
  `CFOP_entrada_inter_estadual` varchar(5) NOT NULL DEFAULT '',
  `CFOP_saida_estadual` varchar(5) NOT NULL DEFAULT '',
  `CFOP_saida_inter_estadual` varchar(5) NOT NULL DEFAULT '',
  `sobrescreve_cfop` tinyint(1) NOT NULL DEFAULT 0,
  `finNFe` int(11) NOT NULL DEFAULT 1,
  `nao_movimenta_estoque` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `natureza_operacaos`
--

INSERT INTO `natureza_operacaos` (`id`, `empresa_id`, `natureza`, `CFOP_entrada_estadual`, `CFOP_entrada_inter_estadual`, `CFOP_saida_estadual`, `CFOP_saida_inter_estadual`, `sobrescreve_cfop`, `finNFe`, `nao_movimenta_estoque`, `created_at`, `updated_at`) VALUES
(1, 1, 'ERP Barbearia', '1000', '2000', '0000', '6000', 0, 1, 1, '2025-01-18 19:34:42', '2025-01-18 19:34:42'),
(2, 2, 'ERP Barbearia', '1000', '2000', '0000', '6000', 0, 1, 1, '2025-01-25 17:03:01', '2025-01-25 17:03:01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `nfses`
--

CREATE TABLE `nfses` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `valor_total` decimal(16,7) NOT NULL,
  `estado_emissao` enum('novo','rejeitado','aprovado','cancelado','processando') NOT NULL,
  `serie` varchar(3) NOT NULL,
  `codigo_verificacao` varchar(20) NOT NULL,
  `numero_nfse` int(11) NOT NULL,
  `url_xml` varchar(255) NOT NULL,
  `url_pdf_nfse` varchar(255) NOT NULL,
  `url_pdf_rps` varchar(255) NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `documento` varchar(18) NOT NULL,
  `razao_social` varchar(60) NOT NULL,
  `im` varchar(20) DEFAULT NULL,
  `ie` varchar(20) DEFAULT NULL,
  `cep` varchar(9) NOT NULL,
  `rua` varchar(80) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `bairro` varchar(40) NOT NULL,
  `complemento` varchar(80) DEFAULT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `natureza_operacao` varchar(100) DEFAULT NULL,
  `uuid` varchar(100) DEFAULT NULL,
  `filial_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `nfse_servicos`
--

CREATE TABLE `nfse_servicos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nfse_id` int(10) UNSIGNED NOT NULL,
  `discriminacao` text NOT NULL,
  `valor_servico` decimal(16,7) NOT NULL,
  `servico_id` int(10) UNSIGNED NOT NULL,
  `codigo_cnae` varchar(30) DEFAULT NULL,
  `codigo_servico` varchar(30) DEFAULT NULL,
  `codigo_tributacao_municipio` varchar(30) DEFAULT NULL,
  `exigibilidade_iss` int(11) NOT NULL,
  `iss_retido` int(11) NOT NULL,
  `data_competencia` date DEFAULT NULL,
  `estado_local_prestacao_servico` varchar(2) DEFAULT NULL,
  `cidade_local_prestacao_servico` varchar(60) DEFAULT NULL,
  `valor_deducoes` decimal(16,7) DEFAULT NULL,
  `desconto_incondicional` decimal(16,7) DEFAULT NULL,
  `desconto_condicional` decimal(16,7) DEFAULT NULL,
  `outras_retencoes` decimal(16,7) DEFAULT NULL,
  `aliquota_iss` decimal(7,2) DEFAULT NULL,
  `aliquota_pis` decimal(7,2) DEFAULT NULL,
  `aliquota_cofins` decimal(7,2) DEFAULT NULL,
  `aliquota_inss` decimal(7,2) DEFAULT NULL,
  `aliquota_ir` decimal(7,2) DEFAULT NULL,
  `aliquota_csll` decimal(7,2) DEFAULT NULL,
  `intermediador` enum('n','f','j') DEFAULT NULL,
  `documento_intermediador` varchar(18) DEFAULT NULL,
  `nome_intermediador` varchar(80) DEFAULT NULL,
  `im_intermediador` varchar(20) DEFAULT NULL,
  `responsavel_retencao_iss` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `nuvem_shop_configs`
--

CREATE TABLE `nuvem_shop_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `client_id` varchar(10) NOT NULL DEFAULT '',
  `client_secret` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(80) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `nuvem_shop_item_pedidos`
--

CREATE TABLE `nuvem_shop_item_pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `nuvem_shop_pedidos`
--

CREATE TABLE `nuvem_shop_pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED DEFAULT NULL,
  `pedido_id` varchar(30) NOT NULL,
  `rua` varchar(80) NOT NULL,
  `numero` varchar(80) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(40) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `observacao` varchar(150) NOT NULL,
  `cliente_id` varchar(30) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `numero_nfe` int(11) NOT NULL DEFAULT 0,
  `status_envio` varchar(20) NOT NULL,
  `gateway` varchar(30) NOT NULL,
  `status_pagamento` varchar(30) NOT NULL,
  `data` varchar(30) NOT NULL,
  `venda_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `n_fe_descargas`
--

CREATE TABLE `n_fe_descargas` (
  `id` int(10) UNSIGNED NOT NULL,
  `info_id` int(10) UNSIGNED NOT NULL,
  `chave` varchar(44) NOT NULL,
  `seg_cod_barras` varchar(44) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `n_fe_referecias`
--

CREATE TABLE `n_fe_referecias` (
  `id` int(10) UNSIGNED NOT NULL,
  `venda_id` int(10) UNSIGNED NOT NULL,
  `chave` varchar(44) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `orcamentos`
--

CREATE TABLE `orcamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `natureza_id` int(10) UNSIGNED DEFAULT NULL,
  `frete_id` int(10) UNSIGNED DEFAULT NULL,
  `transportadora_id` int(10) UNSIGNED DEFAULT NULL,
  `filial_id` int(10) UNSIGNED DEFAULT NULL,
  `valor_total` decimal(16,7) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `acrescimo` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) NOT NULL,
  `tipo_pagamento` varchar(2) NOT NULL,
  `observacao` varchar(255) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `email_enviado` tinyint(1) NOT NULL,
  `validade` date NOT NULL,
  `data_entrega` date DEFAULT NULL,
  `venda_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `orcamentos`
--

INSERT INTO `orcamentos` (`id`, `empresa_id`, `cliente_id`, `usuario_id`, `natureza_id`, `frete_id`, `transportadora_id`, `filial_id`, `valor_total`, `desconto`, `acrescimo`, `forma_pagamento`, `tipo_pagamento`, `observacao`, `estado`, `email_enviado`, `validade`, `data_entrega`, `venda_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 1, NULL, NULL, NULL, 2400.0000000, 1200.00, 0.00, 'a_vista', '17', '', 'REPROVADO', 0, '2025-01-25', '2025-01-18', 0, '2025-01-18 19:43:38', '2025-02-06 23:52:43'),
(2, 2, 2, 5, 2, NULL, NULL, NULL, 140.0000000, 0.00, 0.00, 'a_vista', '01', '', 'APROVADO', 0, '2025-02-01', '2025-01-25', 0, '2025-01-25 18:00:39', '2025-01-25 18:09:45'),
(3, 1, 1, 3, 1, NULL, NULL, NULL, 2400.0000000, 0.00, 0.00, 'a_vista', '04', '', 'REPROVADO', 0, '2025-02-01', '2025-01-25', 0, '2025-01-25 18:02:40', '2025-02-06 23:51:56');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ordem_servicos`
--

CREATE TABLE `ordem_servicos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `estado` enum('pendente','aprovado','reprovado','finalizado') NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `forma_pagamento` varchar(10) DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL DEFAULT 0.00,
  `data_prevista_finalizacao` date DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  `acrescimo` decimal(10,2) DEFAULT NULL,
  `observacao` varchar(100) DEFAULT NULL,
  `venda_id` int(11) NOT NULL DEFAULT 0,
  `nfse_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `ordem_servicos`
--

INSERT INTO `ordem_servicos` (`id`, `empresa_id`, `cliente_id`, `usuario_id`, `estado`, `descricao`, `forma_pagamento`, `valor`, `data_prevista_finalizacao`, `desconto`, `acrescimo`, `observacao`, `venda_id`, `nfse_id`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 3, 'finalizado', 'Manutenção', NULL, 350.00, NULL, NULL, NULL, NULL, 0, 0, '2025-01-18 22:25:48', '2025-01-18 22:30:44'),
(5, 1, 1, 3, 'finalizado', 'Teste', NULL, 350.00, NULL, NULL, NULL, NULL, 0, 0, '2025-01-18 23:19:36', '2025-01-18 23:21:16'),
(9, 2, 2, 5, 'finalizado', 'Necessito de caixas de picolés', NULL, 45.00, NULL, NULL, NULL, NULL, 0, 0, '2025-01-25 18:12:50', '2025-01-25 18:28:38'),
(10, 1, 3, 2, 'finalizado', 'AR CONDICIONADO PINGANDO DO LADO DE FORA DA JANELA', NULL, 420.00, NULL, NULL, NULL, NULL, 0, 0, '2025-01-29 19:04:22', '2025-01-29 19:21:01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pack_produto_deliveries`
--

CREATE TABLE `pack_produto_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(300) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pais`
--

CREATE TABLE `pais` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `pais`
--

INSERT INTO `pais` (`id`, `codigo`, `nome`, `created_at`, `updated_at`) VALUES
(1, 132, 'Afeganistão', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(2, 7560, 'África do Sul', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(3, 175, 'Albânia, República da', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(4, 230, 'Alemanha', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(5, 370, 'Andorra Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(6, 400, 'Angola', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(7, 418, 'Anguilla Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(8, 434, 'Antigua e Barbuda Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(9, 477, 'Antilhas Holandesas Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(10, 531, 'Arábia Saudita', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(11, 590, 'Argélia', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(12, 639, 'Argentina', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(13, 647, 'Armênia, República da', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(14, 655, 'Aruba', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(15, 698, 'Austrália', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(16, 728, 'Áustria', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(17, 736, 'Azerbaijão, República do', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(18, 779, 'Bahamas, Ilhas Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(19, 809, 'Bahrein, Ilhas Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(20, 817, 'Bangladesh', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(21, 833, 'Barbados Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(22, 850, 'Belarus', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(23, 876, 'Bélgica', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(24, 884, 'Belize Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(25, 2291, 'Benin', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(26, 906, 'Bermudas Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(27, 973, 'Bolívia', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(28, 981, 'Bósnia-Herzegovina', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(29, 1015, 'Botsuana', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(30, 1058, 'Brasil', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(31, 1082, 'Brunei', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(32, 1112, 'Bulgária, República da', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(33, 310, 'Burkina Faso', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(34, 1155, 'Burundi', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(35, 1198, 'Butão', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(36, 1279, 'Cabo Verde, República de', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(37, 1457, 'Camarões', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(38, 1414, 'Camboja', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(39, 1490, 'Canadá', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(40, 1504, 'Canal, Ilhas do (Jersey e Guernsey) Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(41, 1511, 'Canárias, Ilhas', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(42, 1546, 'Catar', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(43, 1376, 'Cayman, Ilhas Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(44, 1538, 'Cazaquistão, República do', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(45, 7889, 'Chade', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(46, 1589, 'Chile', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(47, 1600, 'China, República Popular da', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(48, 1635, 'Chipre Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(49, 5118, 'Christmas, Ilha (Navidad)', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(50, 7412, 'Cingapura', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(51, 1651, 'Cocos (Keeling), Ilhas', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(52, 1694, 'Colômbia', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(53, 1732, 'Comores, Ilhas', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(54, 8885, 'Congo, República Democrática do', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(55, 1775, 'Congo, República do', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(56, 1830, 'Cook, Ilhas Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(57, 1872, 'Coréia, Rep. Pop. Democrática da', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(58, 1902, 'Coréia, República da', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(59, 1937, 'Costa do Marfim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(60, 1961, 'Costa Rica  Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(61, 1988, 'Coveite', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(62, 1953, 'Croácia, República da', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(63, 1996, 'Cuba', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(64, 2321, 'Dinamarca', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(65, 7838, 'Djibuti Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(66, 2356, 'Dominica, Ilha Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(67, 2402, 'Egito', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(68, 6874, 'El Salvador', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(69, 2445, 'Emirados Árabes Unidos', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(70, 2399, 'Equador', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(71, 2437, 'Eritréia', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(72, 6289, 'Escócia', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(73, 2470, 'Eslovaca, República', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(74, 2461, 'Eslovênia, República da', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(75, 2453, 'Espanha', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(76, 2496, 'Estados Unidos', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(77, 2518, 'Estônia, República da', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(78, 2534, 'Etiópia', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(79, 2550, 'Falkland (Ilhas Malvinas)', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(80, 2593, 'Feroe, Ilhas', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(81, 8702, 'Fiji', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(82, 2674, 'Filipinas', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(83, 2712, 'Finlândia', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(84, 1619, 'Formosa (Taiwan)', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(85, 2755, 'França', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(86, 2810, 'Gabão', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(87, 6289, 'Gales, País de', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(88, 2852, 'Gâmbia', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(89, 2895, 'Gana', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(90, 2917, 'Geórgia, República da', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(91, 2933, 'Gibraltar Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(92, 6289, 'Grã-Bretanha', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(93, 2976, 'Granada Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(94, 3018, 'Grécia', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(95, 3050, 'Groenlândia', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(96, 3093, 'Guadalupe', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(97, 3131, 'Guam', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(98, 3174, 'Guatemala', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(99, 3379, 'Guiana', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(100, 3255, 'Guiana Francesa', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(101, 3298, 'Guiné', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(102, 3344, 'Guiné-Bissau', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(103, 3310, 'Guiné-Equatorial', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(104, 3417, 'Haiti', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(105, 5738, 'Holanda (Países Baixos)', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(106, 3450, 'Honduras', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(107, 3514, 'Hong Kong, Região Adm. Especial', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(108, 3557, 'Hungria, República da', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(109, 3573, 'Iêmen', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(110, 3611, 'Índia', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(111, 3654, 'Indonésia', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(112, 6289, 'Inglaterra', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(113, 3727, 'Irã, República Islâmica do', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(114, 3697, 'Iraque', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(115, 3751, 'Irlanda', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(116, 6289, 'Irlanda do Norte', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(117, 3794, 'Islândia', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(118, 3832, 'Israel', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(119, 3867, 'Itália', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(120, 3883, 'Iugoslávia, República Fed. da', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(121, 3913, 'Jamaica', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(122, 3999, 'Japão', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(123, 3964, 'Johnston, Ilhas', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(124, 4030, 'Jordânia', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(125, 4111, 'Kiribati', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(126, 4200, 'Laos, Rep. Pop. Democrática do', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(127, 4235, 'Lebuan Sim', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(128, 4260, 'Lesoto', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(129, 4278, 'Letônia, República da', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(130, 4316, 'Líbano', '2024-06-14 16:39:16', '2024-06-14 16:39:16'),
(131, 4340, 'Libéria Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(132, 4383, 'Líbia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(133, 4405, 'Liechtenstein Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(134, 4421, 'Lituânia, República da', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(135, 4456, 'Luxemburgo', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(136, 4472, 'Macau', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(137, 4499, 'Macedônia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(138, 4502, 'Madagascar', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(139, 4525, 'Madeira, Ilha da Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(140, 4553, 'Malásia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(141, 4588, 'Malavi', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(142, 4618, 'Maldivas', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(143, 4642, 'Máli', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(144, 4677, 'Malta Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(145, 3595, 'Man, Ilhas Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(146, 4723, 'Marianas do Norte', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(147, 4740, 'Marrocos', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(148, 4766, 'Marshall, Ilhas Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(149, 4774, 'Martinica', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(150, 4855, 'Maurício Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(151, 4880, 'Mauritânia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(152, 4936, 'México', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(153, 930, 'Mianmar (Birmânia)', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(154, 4995, 'Micronésia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(155, 4901, 'Midway, Ilhas', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(156, 5053, 'Moçambique', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(157, 4944, 'Moldávia, República da', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(158, 4952, 'Mônaco Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(159, 4979, 'Mongólia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(160, 5010, 'Montserrat, Ilhas Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(161, 5070, 'Namíbia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(162, 5088, 'Nauru Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(163, 5177, 'Nepal', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(164, 5215, 'Nicarágua', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(165, 5258, 'Niger', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(166, 5282, 'Nigéria', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(167, 5312, 'Niue, Ilha Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(168, 5355, 'Norfolk, Ilha', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(169, 5380, 'Noruega', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(170, 5428, 'Nova Caledônia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(171, 5487, 'Nova Zelândia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(172, 5568, 'Omã', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(173, 5738, 'Países Baixos (Holanda)', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(174, 5754, 'Palau', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(175, 5800, 'Panamá Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(176, 5452, 'Papua Nova Guiné', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(177, 5762, 'Paquistão', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(178, 5860, 'Paraguai', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(179, 5894, 'Peru', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(180, 5932, 'Pitcairn, Ilha', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(181, 5991, 'Polinésia Francesa', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(182, 6033, 'Polônia, República da', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(183, 6114, 'Porto Rico', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(184, 6076, 'Portugal', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(185, 6238, 'Quênia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(186, 6254, 'Quirguiz, República', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(187, 6289, 'Reino Unido', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(188, 6408, 'República Centro-Africana', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(189, 6475, 'República Dominicana', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(190, 6602, 'Reunião, Ilha', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(191, 6700, 'Romênia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(192, 6750, 'Ruanda', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(193, 6769, 'Rússia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(194, 6858, 'Saara Ocidental', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(195, 6777, 'Salomão, Ilhas', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(196, 6904, 'Samoa Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(197, 6912, 'Samoa Americana', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(198, 6971, 'San Marino Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(199, 7102, 'Santa Helena', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(200, 7153, 'Santa Lúcia Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(201, 6955, 'São Cristóvão e Neves Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(202, 7005, 'São Pedro e Miquelon', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(203, 7200, 'São Tomé e Príncipe, Ilhas', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(204, 7056, 'São Vicente e Granadinas Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(205, 7285, 'Senegal', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(206, 7358, 'Serra Leoa', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(207, 7315, 'Seychelles Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(208, 7447, 'Síria, República Árabe da', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(209, 7480, 'Somália', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(210, 7501, 'Sri Lanka', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(211, 7544, 'Suazilândia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(212, 7595, 'Sudão', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(213, 7641, 'Suécia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(214, 7676, 'Suíça', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(215, 7706, 'Suriname', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(216, 7722, 'Tadjiquistão', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(217, 7765, 'Tailândia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(218, 7803, 'Tanzânia, República Unida da', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(219, 7919, 'Tcheca, República', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(220, 7820, 'Território Britânico Oc. Índico ', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(221, 7951, 'Timor Leste', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(222, 8001, 'Togo', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(223, 8109, 'Tonga Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(224, 8052, 'Toquelau, Ilhas', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(225, 8150, 'Trinidad e Tobago', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(226, 8206, 'Tunísia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(227, 8230, 'Turcas e Caicos, Ilhas Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(228, 8249, 'Turcomenistão, República do', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(229, 8273, 'Turquia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(230, 8281, 'Tuvalu', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(231, 8311, 'Ucrânia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(232, 8338, 'Uganda', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(233, 8451, 'Uruguai', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(234, 8478, 'Uzbequistão, República do', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(235, 5517, 'Vanuatu Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(236, 8486, 'Vaticano, Estado da Cidade do', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(237, 8508, 'Venezuela', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(238, 8583, 'Vietnã', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(239, 8630, 'Virgens, Ilhas (Britânicas) Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(240, 8664, 'Virgens, Ilhas (E.U.A.) Sim', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(241, 8737, 'Wake, Ilha', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(242, 8753, 'Wallis e Futuna, Ilhas', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(243, 8907, 'Zâmbia', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(244, 6653, 'Zimbábue', '2024-06-14 16:39:17', '2024-06-14 16:39:17'),
(245, 8958, 'Zona do Canal do Panamá', '2024-06-14 16:39:17', '2024-06-14 16:39:17');

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `plano_id` int(10) UNSIGNED NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `transacao_id` varchar(100) NOT NULL,
  `forma_pagamento` varchar(10) NOT NULL,
  `status` varchar(15) NOT NULL,
  `status_detalhe` varchar(100) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `link_boleto` text NOT NULL,
  `qr_code_base64` text NOT NULL,
  `qr_code` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `comanda` varchar(12) NOT NULL,
  `observacao` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `mesa_id` int(10) UNSIGNED DEFAULT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `bairro_id` int(10) UNSIGNED DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `referencia` varchar(30) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `desativado` tinyint(1) NOT NULL,
  `referencia_cliete` varchar(200) NOT NULL DEFAULT '',
  `mesa_ativa` tinyint(1) NOT NULL DEFAULT 1,
  `fechar_mesa` tinyint(1) NOT NULL DEFAULT 1,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `empresa_id`, `comanda`, `observacao`, `status`, `mesa_id`, `cliente_id`, `bairro_id`, `nome`, `rua`, `numero`, `referencia`, `telefone`, `desativado`, `referencia_cliete`, `mesa_ativa`, `fechar_mesa`, `data_registro`, `created_at`, `updated_at`) VALUES
(1, 1, '25', '', 0, 1, 1, NULL, '', '', '', '', '', 1, '', 1, 1, '2025-01-19 01:44:54', '2025-01-19 01:44:54', '2025-01-19 03:09:29'),
(2, 1, '26', '', 0, 2, 1, NULL, '', '', '', '', '', 1, '', 1, 1, '2025-01-19 02:46:17', '2025-01-19 02:46:17', '2025-01-19 03:09:33'),
(3, 1, '25', '', 0, 1, 1, NULL, '', '', '', '', '', 0, '', 1, 1, '2025-01-19 03:09:52', '2025-01-19 03:09:52', '2025-01-19 03:09:52'),
(4, 1, '26', '', 0, 2, 1, NULL, '', '', '', '', '', 1, '', 1, 1, '2025-01-19 03:16:38', '2025-01-19 03:16:38', '2025-01-19 03:21:11'),
(5, 1, '27', '', 0, 2, 1, NULL, '', '', '', '', '', 1, '', 1, 1, '2025-01-19 03:19:28', '2025-01-19 03:19:28', '2025-01-19 03:21:05'),
(6, 1, '28', '', 0, 2, 1, NULL, '', '', '', '', '', 0, '', 1, 1, '2025-01-19 03:21:27', '2025-01-19 03:21:27', '2025-01-19 03:21:27'),
(7, 2, '14', '', 0, NULL, NULL, NULL, '', '', '', '', '', 1, '', 1, 1, '2025-01-25 18:58:07', '2025-01-25 18:58:07', '2025-01-25 19:00:45'),
(8, 2, '20', '', 0, NULL, NULL, NULL, '', '', '', '', '', 0, '', 1, 1, '2025-01-25 19:07:05', '2025-01-25 19:07:05', '2025-01-25 19:07:05'),
(9, 1, '57', '', 0, NULL, NULL, NULL, '', '', '', '', '', 0, '', 1, 1, '2025-01-29 18:27:42', '2025-01-29 18:27:42', '2025-01-29 18:27:42'),
(10, 1, '50', '', 0, 2, 3, NULL, '', '', '', '', '', 0, '', 1, 1, '2025-01-29 18:49:59', '2025-01-29 18:49:59', '2025-01-29 18:49:59');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_deletes`
--

CREATE TABLE `pedido_deletes` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `produto` varchar(100) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_insercao` varchar(20) NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `pedido_deletes`
--

INSERT INTO `pedido_deletes` (`id`, `empresa_id`, `produto`, `pedido_id`, `valor`, `data_insercao`, `quantidade`, `created_at`, `updated_at`) VALUES
(1, 1, 'ERP Barbearia', 4, 2400.00, '2025-01-19 00:17:29', 1.00, '2025-01-19 03:17:39', '2025-01-19 03:17:39');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_deliveries`
--

CREATE TABLE `pedido_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `valor_total` decimal(10,2) NOT NULL,
  `troco_para` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) NOT NULL,
  `observacao` varchar(50) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `estado` enum('novo','aprovado','cancelado','finalizado') NOT NULL,
  `motivoEstado` varchar(50) NOT NULL,
  `endereco_id` int(10) UNSIGNED DEFAULT NULL,
  `cupom_id` int(10) UNSIGNED DEFAULT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `valor_entrega` decimal(10,2) NOT NULL,
  `app` tinyint(1) NOT NULL,
  `qr_code_base64` text NOT NULL,
  `qr_code` text NOT NULL,
  `transacao_id` varchar(50) NOT NULL DEFAULT '',
  `status_pagamento` varchar(100) NOT NULL DEFAULT '',
  `pedido_lido` tinyint(1) NOT NULL DEFAULT 0,
  `horario_cricao` varchar(5) NOT NULL,
  `horario_leitura` varchar(5) NOT NULL,
  `horario_entrega` varchar(5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_ecommerces`
--

CREATE TABLE `pedido_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `endereco_id` int(10) UNSIGNED DEFAULT NULL,
  `status` int(11) NOT NULL,
  `status_preparacao` int(11) NOT NULL,
  `codigo_rastreio` varchar(20) NOT NULL DEFAULT '',
  `valor_total` decimal(10,2) NOT NULL,
  `valor_frete` decimal(10,2) NOT NULL,
  `tipo_frete` varchar(10) NOT NULL,
  `venda_id` int(11) NOT NULL DEFAULT 0,
  `numero_nfe` int(11) NOT NULL DEFAULT 0,
  `observacao` varchar(100) NOT NULL,
  `rand_pedido` varchar(20) NOT NULL,
  `token` varchar(20) NOT NULL DEFAULT '',
  `link_boleto` text NOT NULL,
  `qr_code_base64` text NOT NULL,
  `qr_code` text NOT NULL,
  `transacao_id` varchar(100) NOT NULL DEFAULT '',
  `forma_pagamento` varchar(10) NOT NULL DEFAULT '',
  `status_pagamento` varchar(15) NOT NULL DEFAULT '',
  `status_detalhe` varchar(100) NOT NULL DEFAULT '',
  `hash` varchar(20) NOT NULL DEFAULT '',
  `cupom_desconto` varchar(6) DEFAULT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_motoboys`
--

CREATE TABLE `pedido_motoboys` (
  `id` int(10) UNSIGNED NOT NULL,
  `motoboy_id` int(10) UNSIGNED DEFAULT NULL,
  `pedido_id` int(10) UNSIGNED DEFAULT NULL,
  `valor` decimal(7,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_pag_seguros`
--

CREATE TABLE `pedido_pag_seguros` (
  `id` int(10) UNSIGNED NOT NULL,
  `pedido_delivery_id` int(10) UNSIGNED NOT NULL,
  `numero_cartao` varchar(20) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `nome_impresso` varchar(25) NOT NULL,
  `codigo_transacao` varchar(45) NOT NULL,
  `referencia` varchar(35) NOT NULL,
  `bandeira` varchar(10) NOT NULL,
  `parcelas` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_qr_code_clientes`
--

CREATE TABLE `pedido_qr_code_clientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(10) UNSIGNED DEFAULT NULL,
  `hash` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `percursos`
--

CREATE TABLE `percursos` (
  `id` int(10) UNSIGNED NOT NULL,
  `mdfe_id` int(10) UNSIGNED NOT NULL,
  `uf` varchar(2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil_acessos`
--

CREATE TABLE `perfil_acessos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `permissao` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pesquisas`
--

CREATE TABLE `pesquisas` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `texto` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `maximo_acessos` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `planos`
--

CREATE TABLE `planos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(40) NOT NULL,
  `valor` decimal(6,2) NOT NULL,
  `maximo_clientes` int(11) NOT NULL,
  `maximo_produtos` int(11) NOT NULL,
  `maximo_fornecedores` int(11) NOT NULL,
  `maximo_nfes` int(11) NOT NULL,
  `maximo_nfces` int(11) NOT NULL,
  `maximo_cte` int(11) NOT NULL,
  `maximo_mdfe` int(11) NOT NULL,
  `maximo_evento` int(11) NOT NULL,
  `maximo_usuario` int(11) NOT NULL,
  `armazenamento` int(11) NOT NULL,
  `maximo_usuario_simultaneo` int(11) NOT NULL,
  `delivery` tinyint(1) NOT NULL,
  `perfil_id` int(11) NOT NULL,
  `intervalo_dias` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `img` varchar(100) NOT NULL,
  `visivel` tinyint(1) NOT NULL DEFAULT 1,
  `api_sieg` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `planos`
--

INSERT INTO `planos` (`id`, `nome`, `valor`, `maximo_clientes`, `maximo_produtos`, `maximo_fornecedores`, `maximo_nfes`, `maximo_nfces`, `maximo_cte`, `maximo_mdfe`, `maximo_evento`, `maximo_usuario`, `armazenamento`, `maximo_usuario_simultaneo`, `delivery`, `perfil_id`, `intervalo_dias`, `descricao`, `img`, `visivel`, `api_sieg`, `created_at`, `updated_at`) VALUES
(1, 'HTC', 0.00, -1, -1, -1, -1, -1, -1, 0, 0, -1, 0, -1, 0, 0, -1, '', 'DKAh9wkxvcPtPhm8aoMHljZFe.png', 0, 0, '2025-01-18 19:18:58', '2025-01-18 19:18:58'),
(2, 'PDV (P)', 99.90, 100, 50, 10, -1, -1, -1, 0, 0, 2, 0, 2, 0, 0, 30, '<p><strong>Plano P - Ideal para quem está iniciando o negócio</strong></p><ul><li>&nbsp;Máximo de 100 clientes cadastrados (opcional cadastrar cliente);</li><li>&nbsp;Máximo de 20 produtos cadastrados;</li><li>&nbsp;Máximo de 10 fornecedores cadastrados (opcional cadastrar fornecedor);</li></ul><p><strong>O que inclui no plano</strong></p><ul><li>&nbsp;Acesso para 2 usuários, sendo somente 1 responsável pela abertura e fechamento do caixa;</li><li>&nbsp;Venda por Comanda;</li><li>&nbsp;Venda por PDV (Frente de Caixa);</li><li>&nbsp;Controle de estoque;</li><li>&nbsp;Gestão de Usuários e Funcionários;</li><li>&nbsp;Movimentação de Caixa;</li><li>&nbsp;Módulos de cadastro (clientes, fornecedores, produtos, categorias, formas de pagamento e usuários);</li><li>&nbsp;Relatórios</li></ul><p><strong>Não inclui no plano</strong></p><ul><li>&nbsp;Contas a pagar;</li><li>&nbsp;Contas a receber;</li><li>&nbsp;Gráficos;</li><li>&nbsp;Venda direta;</li><li>&nbsp;Orçamentos;</li><li>&nbsp;Ordem de serviço.</li></ul><p>&nbsp;</p>', '', 1, 0, '2025-01-18 19:55:41', '2025-02-07 01:17:50'),
(3, 'Social Media (P)', 120.00, -1, -1, -1, -1, -1, -1, 0, 0, -1, 0, -1, 0, 0, 30, '<p><strong>Inclui no plano:</strong></p><ul><li>Gestão de 1 (uma) rede social;</li><li>2 Postagens semanais com a identidade definida pelo cliente;</li><li>Conteúdo (textos, fotos e afins) definidos pelo cliente.</li></ul><p><strong>Não inclui neste plano:</strong></p><ul><li>Criação e edição de Reels;</li><li>Tráfego Pago;</li><li>Acompanhamento personalizado de métricas.</li></ul><p>&nbsp;</p>', 'BWog9CLB3pM5gq2iuF7qdpLCT.jpg', 0, 0, '2025-02-07 00:08:51', '2025-02-07 00:23:10'),
(4, 'Social Media (M)', 170.00, -1, -1, -1, -1, -1, -1, 0, 0, -1, 0, -1, 0, 0, 30, '<p><strong>Inclui no plano:</strong></p><ul><li>Gestão de 2 (duas) redes sociais;</li><li>2 Postagens semanais (em cada rede social) com a identidade definida pelo cliente;</li><li>Conteúdo (textos, fotos e afins) definidos pelo cliente.</li></ul><p><strong>Não inclui neste plano:</strong></p><ul><li>Criação e edição de Reels;</li><li>Tráfego Pago;</li><li>Acompanhamento personalizado de métricas.</li></ul><p>&nbsp;</p>', '1E32etOSGElJSZw0SzlIpSC6Z.jpg', 0, 0, '2025-02-07 00:11:22', '2025-02-07 00:23:26'),
(5, 'Social Media (G)', 240.00, -1, -1, -1, -1, -1, -1, 0, 0, -1, 0, -1, 0, 0, 30, '<p><strong>Inclui no plano:</strong></p><ul><li>Gestão de 2 (duas) redes sociais;</li><li>3 Postagens semanais (em cada rede social) com a identidade definida pelo cliente;</li><li>Conteúdo (textos, fotos e afins) definidos pelo cliente;</li><li>Tráfego Pago (valor do Tráfego disponibilizado pelo cliente na plataforma);</li><li>Acompanhamento personalizado de métricas.</li></ul><p><strong>Não inclui neste plano:</strong></p><ul><li>Criação e edição de Reels;</li></ul><p>&nbsp;</p>', 'PrpzuuL4aH6I0Q4S0advgthzo.jpg', 0, 0, '2025-02-07 00:15:01', '2025-02-07 00:23:41'),
(6, 'Social Media (Full)', 350.00, -1, -1, -1, -1, -1, -1, 0, 0, -1, 0, -1, 0, 0, 30, '<p><strong>Inclui no plano:</strong></p><ul><li>Gestão de 2 (duas) redes sociais;</li><li>3 Postagens semanais (em cada rede social) com a identidade definida pelo cliente;</li><li>Conteúdo (textos, fotos e afins) definidos pelo cliente;</li><li>Tráfego Pago (valor do Tráfego disponibilizado pelo cliente na plataforma);</li><li>Acompanhamento personalizado de métricas;</li><li>2 Reels por semana (Criação e edição de Reels)***</li></ul><p>&nbsp;</p><p>*** Vídeos criados pelo cliente, devem ser enviados via Google Drive, para edição e postagem (cronograma a definir)</p>', 'V3wCnuOJHVSJbyqPsRA1a5Y2X.jpg', 0, 0, '2025-02-07 00:21:06', '2025-02-07 00:23:52'),
(7, 'PDV (M)', 247.90, 200, 100, 25, -1, -1, -1, 0, 0, 3, 0, 3, 0, 0, 30, '<p><strong>Plano M - Ideal para quem está expandindo o negócio</strong></p><ul><li>&nbsp;Máximo de 200 clientes cadastrados (opcional cadastrar cliente);</li><li>&nbsp;Máximo de 100 produtos cadastrados;</li><li>&nbsp;Máximo de 25 fornecedores cadastrados (opcional cadastrar fornecedor);</li></ul><p><strong>O que inclui no plano</strong></p><ul><li>&nbsp;Acesso para 3 usuários, sendo somente 1 responsável pela abertura e fechamento do caixa;</li><li>&nbsp;Venda por Comanda;</li><li>&nbsp;Venda por PDV (Frente de Caixa);</li><li>&nbsp;Controle de estoque;</li><li>&nbsp;Gestão de Usuários e Funcionários;</li><li>&nbsp;Movimentação de Caixa;</li><li>&nbsp;Módulos de cadastro (clientes, fornecedores, produtos, categorias, formas de pagamento e usuários);</li><li>&nbsp;Contas a pagar;</li><li>&nbsp;Contas a receber;</li><li>&nbsp;Relatórios;</li><li>&nbsp;Gráficos;</li></ul><p><strong>Não inclui no plano</strong></p><ul><li>&nbsp;Venda direta;</li><li>&nbsp;Orçamentos;</li><li>&nbsp;Ordem de serviço;</li></ul><p>&nbsp;</p>', '', 1, 0, '2025-02-07 01:10:28', '2025-02-07 01:17:15'),
(8, 'PDV (G)', 397.90, 500, 300, 100, -1, -1, -1, 0, 0, 5, 0, 5, 0, 0, 30, '<p><strong>Plano G - Ideal para negócios consolidados</strong></p><ul><li>&nbsp;Máximo de 500 clientes cadastrados (opcional cadastrar cliente);</li><li>&nbsp;Máximo de 300 produtos cadastrados;</li><li>&nbsp;Máximo de 100 fornecedores cadastrados (opcional cadastrar fornecedor);</li></ul><p><strong>O que inclui no plano</strong></p><ul><li>&nbsp;Acesso para 5 usuários, sendo somente 1 responsável pela abertura e fechamento do caixa;</li><li>&nbsp;Venda por Comanda;</li><li>&nbsp;Venda por PDV (Frente de Caixa);</li><li>&nbsp;Controle de estoque;</li><li>&nbsp;Gestão de Usuários e Funcionários;</li><li>&nbsp;Movimentação de Caixa;</li><li>&nbsp;Módulos de cadastro (clientes, fornecedores, produtos, categorias, formas de pagamento e usuários);</li><li>&nbsp;Contas a pagar;</li><li>&nbsp;Contas a receber;</li><li>&nbsp;Relatórios;</li><li>&nbsp;Gráficos;</li><li>&nbsp;Venda direta;</li><li>&nbsp;Orçamentos;</li></ul><p><strong>Não inclui no plano</strong></p><ul><li>&nbsp;Ordem de serviço. (Entrar em contato para plano personalizado)</li></ul><p>&nbsp;</p>', '', 1, 0, '2025-02-07 01:26:30', '2025-02-07 01:28:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `plano_empresas`
--

CREATE TABLE `plano_empresas` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `plano_id` int(10) UNSIGNED NOT NULL,
  `expiracao` date NOT NULL,
  `mensagem_alerta` varchar(255) NOT NULL DEFAULT '',
  `valor` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `plano_empresas`
--

INSERT INTO `plano_empresas` (`id`, `empresa_id`, `plano_id`, `expiracao`, `mensagem_alerta`, `valor`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0000-00-00', '', 0.00, '2025-01-18 19:21:34', '2025-01-18 19:21:34'),
(2, 2, 2, '2025-02-24', '', 99.90, '2025-01-25 17:05:49', '2025-01-25 17:05:49'),
(3, 3, 3, '0000-00-00', 'Favor verificar renovação', 120.00, '2025-02-07 00:29:43', '2025-02-07 00:29:43');

-- --------------------------------------------------------

--
-- Estrutura para tabela `plano_empresa_representantes`
--

CREATE TABLE `plano_empresa_representantes` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `plano_id` int(10) UNSIGNED NOT NULL,
  `representante_id` int(10) UNSIGNED NOT NULL,
  `expiracao` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `post_blog_ecommerces`
--

CREATE TABLE `post_blog_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `img` varchar(50) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `texto` text NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `autor_id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `sub_categoria_id` int(10) UNSIGNED DEFAULT NULL,
  `marca_id` int(10) UNSIGNED DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `cor` varchar(20) NOT NULL,
  `referencia_balanca` int(11) NOT NULL DEFAULT 0,
  `valor_venda` decimal(16,7) NOT NULL DEFAULT 0.0000000,
  `valor_compra` decimal(16,7) NOT NULL DEFAULT 0.0000000,
  `reajuste_automatico` tinyint(1) NOT NULL DEFAULT 0,
  `percentual_lucro` decimal(10,2) NOT NULL DEFAULT 0.00,
  `NCM` varchar(13) NOT NULL DEFAULT '',
  `codBarras` varchar(15) NOT NULL DEFAULT '',
  `CEST` varchar(10) NOT NULL DEFAULT '',
  `CST_CSOSN` varchar(3) NOT NULL DEFAULT '',
  `CST_PIS` varchar(3) NOT NULL DEFAULT '',
  `CST_COFINS` varchar(3) NOT NULL DEFAULT '',
  `CST_IPI` varchar(3) NOT NULL DEFAULT '',
  `CST_CSOSN_EXP` varchar(3) NOT NULL DEFAULT '',
  `unidade_compra` varchar(10) NOT NULL,
  `conversao_unitaria` varchar(255) NOT NULL DEFAULT '1',
  `unidade_venda` varchar(10) NOT NULL,
  `composto` tinyint(1) NOT NULL DEFAULT 0,
  `valor_livre` tinyint(1) NOT NULL,
  `derivado_petroleo` tinyint(1) NOT NULL,
  `perc_icms` decimal(10,2) NOT NULL DEFAULT 0.00,
  `perc_pis` decimal(10,2) NOT NULL DEFAULT 0.00,
  `perc_cofins` decimal(10,2) NOT NULL DEFAULT 0.00,
  `perc_ipi` decimal(10,2) NOT NULL DEFAULT 0.00,
  `perc_iss` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cListServ` varchar(5) NOT NULL,
  `CFOP_saida_estadual` varchar(5) NOT NULL,
  `CFOP_saida_inter_estadual` varchar(5) NOT NULL,
  `codigo_anp` varchar(10) NOT NULL,
  `descricao_anp` varchar(95) NOT NULL,
  `perc_glp` decimal(5,2) NOT NULL DEFAULT 0.00,
  `perc_gnn` decimal(5,2) NOT NULL DEFAULT 0.00,
  `perc_gni` decimal(5,2) NOT NULL DEFAULT 0.00,
  `valor_partida` decimal(10,2) NOT NULL DEFAULT 0.00,
  `unidade_tributavel` varchar(4) NOT NULL DEFAULT '',
  `quantidade_tributavel` decimal(10,2) NOT NULL DEFAULT 0.00,
  `imagem` varchar(100) NOT NULL,
  `alerta_vencimento` int(11) NOT NULL,
  `gerenciar_estoque` tinyint(1) NOT NULL,
  `estoque_minimo` int(11) NOT NULL DEFAULT 0,
  `referencia` varchar(50) NOT NULL DEFAULT '',
  `pRedBC` decimal(5,2) NOT NULL DEFAULT 0.00,
  `perc_reducao` decimal(5,2) NOT NULL DEFAULT 0.00,
  `cBenef` varchar(10) NOT NULL DEFAULT '',
  `largura` decimal(6,2) NOT NULL DEFAULT 0.00,
  `comprimento` decimal(6,2) NOT NULL DEFAULT 0.00,
  `altura` decimal(6,2) NOT NULL DEFAULT 0.00,
  `peso_liquido` decimal(8,3) NOT NULL DEFAULT 0.000,
  `peso_bruto` decimal(8,3) NOT NULL DEFAULT 0.000,
  `limite_maximo_desconto` decimal(5,2) NOT NULL DEFAULT 0.00,
  `referencia_grade` varchar(20) NOT NULL DEFAULT '',
  `grade` tinyint(1) NOT NULL DEFAULT 0,
  `str_grade` varchar(20) NOT NULL DEFAULT '',
  `perc_icms_interestadual` decimal(10,2) NOT NULL DEFAULT 0.00,
  `perc_icms_interno` decimal(10,2) NOT NULL DEFAULT 0.00,
  `perc_fcp_interestadual` decimal(10,2) NOT NULL DEFAULT 0.00,
  `inativo` tinyint(1) NOT NULL DEFAULT 0,
  `renavam` varchar(20) NOT NULL DEFAULT '',
  `placa` varchar(9) NOT NULL DEFAULT '',
  `chassi` varchar(30) NOT NULL DEFAULT '',
  `combustivel` varchar(15) NOT NULL DEFAULT '',
  `ano_modelo` varchar(9) NOT NULL DEFAULT '',
  `cor_veiculo` varchar(20) NOT NULL DEFAULT '',
  `valor_locacao` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `lote` varchar(10) NOT NULL DEFAULT '',
  `vencimento` varchar(10) NOT NULL DEFAULT '',
  `origem` int(11) NOT NULL DEFAULT 0,
  `tipo_dimensao` varchar(15) NOT NULL DEFAULT '',
  `perc_comissao` decimal(5,2) NOT NULL DEFAULT 0.00,
  `acrescimo_perca` decimal(5,2) NOT NULL DEFAULT 0.00,
  `nuvemshop_id` varchar(20) NOT NULL DEFAULT '',
  `ifood_id` varchar(40) NOT NULL DEFAULT '',
  `info_tecnica_composto` text NOT NULL,
  `CST_CSOSN_entrada` varchar(3) NOT NULL DEFAULT '',
  `CST_PIS_entrada` varchar(3) NOT NULL DEFAULT '',
  `CST_COFINS_entrada` varchar(3) NOT NULL DEFAULT '',
  `CST_IPI_entrada` varchar(3) NOT NULL DEFAULT '',
  `CFOP_entrada_estadual` varchar(5) NOT NULL,
  `CFOP_entrada_inter_estadual` varchar(5) NOT NULL,
  `custo_assessor` decimal(10,2) NOT NULL DEFAULT 0.00,
  `envia_controle_pedidos` tinyint(1) NOT NULL DEFAULT 0,
  `cenq_ipi` varchar(3) NOT NULL DEFAULT '999',
  `tela_pedido_id` int(11) DEFAULT NULL,
  `modBCST` int(11) NOT NULL DEFAULT 0,
  `modBC` int(11) NOT NULL DEFAULT 0,
  `pICMSST` decimal(5,2) NOT NULL DEFAULT 0.00,
  `locais` text NOT NULL,
  `perc_frete` decimal(6,2) NOT NULL DEFAULT 0.00,
  `perc_outros` decimal(6,2) NOT NULL DEFAULT 0.00,
  `perc_mlv` decimal(6,2) NOT NULL DEFAULT 0.00,
  `perc_mva` decimal(6,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `empresa_id`, `categoria_id`, `sub_categoria_id`, `marca_id`, `nome`, `cor`, `referencia_balanca`, `valor_venda`, `valor_compra`, `reajuste_automatico`, `percentual_lucro`, `NCM`, `codBarras`, `CEST`, `CST_CSOSN`, `CST_PIS`, `CST_COFINS`, `CST_IPI`, `CST_CSOSN_EXP`, `unidade_compra`, `conversao_unitaria`, `unidade_venda`, `composto`, `valor_livre`, `derivado_petroleo`, `perc_icms`, `perc_pis`, `perc_cofins`, `perc_ipi`, `perc_iss`, `cListServ`, `CFOP_saida_estadual`, `CFOP_saida_inter_estadual`, `codigo_anp`, `descricao_anp`, `perc_glp`, `perc_gnn`, `perc_gni`, `valor_partida`, `unidade_tributavel`, `quantidade_tributavel`, `imagem`, `alerta_vencimento`, `gerenciar_estoque`, `estoque_minimo`, `referencia`, `pRedBC`, `perc_reducao`, `cBenef`, `largura`, `comprimento`, `altura`, `peso_liquido`, `peso_bruto`, `limite_maximo_desconto`, `referencia_grade`, `grade`, `str_grade`, `perc_icms_interestadual`, `perc_icms_interno`, `perc_fcp_interestadual`, `inativo`, `renavam`, `placa`, `chassi`, `combustivel`, `ano_modelo`, `cor_veiculo`, `valor_locacao`, `lote`, `vencimento`, `origem`, `tipo_dimensao`, `perc_comissao`, `acrescimo_perca`, `nuvemshop_id`, `ifood_id`, `info_tecnica_composto`, `CST_CSOSN_entrada`, `CST_PIS_entrada`, `CST_COFINS_entrada`, `CST_IPI_entrada`, `CFOP_entrada_estadual`, `CFOP_entrada_inter_estadual`, `custo_assessor`, `envia_controle_pedidos`, `cenq_ipi`, `tela_pedido_id`, `modBCST`, `modBC`, `pICMSST`, `locais`, `perc_frete`, `perc_outros`, `perc_mlv`, `perc_mva`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 'ERP Barbearia', '0', 0, 2400.0000000, 40.0000000, 0, 900.00, '0000.00.00', '0', '', '00', '01', '01', '50', '00', 'UN', '1', 'UN', 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, '', '0000', '6000', '210101001', '', 0.00, 0.00, 0.00, 0.00, '', 0.00, '', 0, 1, 0, '369258', 0.00, 0.00, '0', 0.00, 0.00, 0.00, 0.000, 0.000, 999.99, 'RHEsw8DbsbHZMSzUB7MQ', 0, '', 0.00, 0.00, 0.00, 0, '', '', '', '', '', '', 0.0000, '0', '', 0, '2', 0.00, 0.00, '', '', '', '00', '50', '50', '00', '1000', '2000', 0.00, 0, '999', NULL, 0, 0, 0.00, '[-1]', 0.00, 0.00, 0.00, 0.00, '2025-01-18 19:38:50', '2025-01-18 19:50:03'),
(3, 1, 3, 2, 1, 'Pizza Calabresa', '0', 0, 48.9000000, 15.0000000, 0, 226.00, '0000.00.00', '0', '', '00', '01', '01', '50', '00', 'UN', '1', 'UN', 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, '', '0000', '6000', '210101001', '', 0.00, 0.00, 0.00, 0.00, '', 0.00, '', 0, 1, 0, '17825', 0.00, 0.00, '0', 0.00, 0.00, 0.00, 0.000, 0.000, 999.99, 'gs5PNR2C9DMIrld0oYwU', 0, '', 0.00, 0.00, 0.00, 0, '', '', '', '', '', '', 0.0000, '0', '', 0, '2', 0.00, 0.00, '', '', '', '00', '50', '50', '00', '1000', '2000', 0.00, 0, '999', 0, 0, 0, 0.00, '[-1]', 0.00, 0.00, 0.00, 0.00, '2025-01-19 03:20:53', '2025-01-19 03:20:53'),
(4, 2, 9, NULL, 2, 'Picolé de Morango', '0', 0, 4.0000000, 1.5000000, 0, 166.67, '0000.00.00', '0', '', '00', '01', '01', '50', '00', 'UN', '1', 'UN', 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, '', '0000', '6000', '210101001', '', 0.00, 0.00, 0.00, 0.00, '', 0.00, 'c267eh6N7tsxXCAecW6CDiCPq.png', 0, 1, 15, '369258', 0.00, 0.00, '0', 0.00, 0.00, 0.00, 0.000, 0.000, 1.00, 'hvEnVFdaUMfpvMHM78Rd', 0, '', 0.00, 0.00, 0.00, 0, '', '', '', '', '', '', 0.0000, '0', '', 0, '2', 0.00, 0.00, '', '', '', '00', '50', '50', '00', '1000', '2000', 0.00, 0, '999', 0, 0, 0, 0.00, '[-1]', 0.00, 0.00, 0.00, 0.00, '2025-01-25 17:23:44', '2025-01-25 17:23:44'),
(5, 1, 10, NULL, 3, 'AÇAI COMPLETO GRANDE', '0', 0, 22.0000000, 20.0000000, 0, 10.00, '0000.00.00', '7891000174043', '', '00', '01', '01', '50', '00', 'UN', '1', 'UN', 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, '', '0000', '6000', '210101001', '', 0.00, 0.00, 0.00, 0.00, '', 0.00, '', 2025, 0, 0, '0002', 0.00, 0.00, '0', 0.00, 0.00, 0.00, 120.000, 0.000, 8.00, 'cjVYpKzNEWrv9zMQxDmy', 0, '', 0.00, 0.00, 0.00, 0, '', '', '', '', '', '', 0.0000, '0', '', 0, '2', 0.00, 0.00, '', '', '', '00', '50', '50', '00', '1000', '2000', 0.00, 0, '999', 0, 0, 0, 0.00, '[-1]', 0.00, 0.00, 0.00, 0.00, '2025-01-29 18:46:08', '2025-01-29 18:46:08'),
(6, 1, 2, NULL, 1, 'LUCAS LATEX', '0', 0, 16.5000000, 15.0000000, 0, 10.00, '0000.00.00', '7891000822098', '', '00', '01', '01', '50', '00', 'UN', '1', 'UN', 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, '', '0000', '6000', '210101001', '', 0.00, 0.00, 0.00, 0.00, '', 0.00, '', 0, 0, 0, '0003', 0.00, 0.00, '0', 0.00, 0.00, 0.00, 0.000, 0.000, 0.00, 'b5Mu6tXHd4gyn4vBBa6H', 0, '', 0.00, 0.00, 0.00, 0, '', '', '', '', '', '', 0.0000, '0', '', 0, '2', 0.00, 0.00, '', '', '', '00', '50', '50', '00', '1000', '2000', 0.00, 0, '999', 0, 0, 0, 0.00, '[-1]', 0.00, 0.00, 0.00, 0.00, '2025-01-29 19:15:48', '2025-01-29 19:15:48'),
(7, 1, 2, NULL, 1, 'TOMADA 220W', '0', 0, 4.5000000, 3.0000000, 0, 0.00, '0000.00.00', '7891000311875', '', '00', '01', '01', '50', '00', 'UN', '1', 'UN', 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, '', '0000', '6000', '210101001', '', 0.00, 0.00, 0.00, 0.00, '', 0.00, '', 0, 0, 0, '0004', 0.00, 0.00, '0', 0.00, 0.00, 0.00, 0.000, 0.000, 0.00, '2TkIVa4jFqzFyIYUD1J2', 0, '', 0.00, 0.00, 0.00, 0, '', '', '', '', '', '', 0.0000, '0', '', 0, '2', 0.00, 0.00, '', '', '', '00', '50', '50', '00', '1000', '2000', 0.00, 0, '999', 0, 0, 0, 0.00, '[-1]', 0.00, 0.00, 0.00, 0.00, '2025-01-29 19:16:57', '2025-01-29 19:16:57');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_deliveries`
--

CREATE TABLE `produto_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `descricao_curta` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `ingredientes` varchar(255) NOT NULL,
  `referencia` varchar(12) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `valor_anterior` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `destaque` tinyint(1) NOT NULL,
  `limite_diario` int(11) NOT NULL,
  `tem_adicionais` tinyint(1) NOT NULL DEFAULT 0,
  `tipo` enum('simples','variavel') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_destaque_master_deliveries`
--

CREATE TABLE `produto_destaque_master_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_ecommerces`
--

CREATE TABLE `produto_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `sub_categoria_id` int(11) NOT NULL DEFAULT 0,
  `descricao` text NOT NULL,
  `controlar_estoque` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `destaque` tinyint(1) NOT NULL,
  `cep` varchar(9) NOT NULL DEFAULT '',
  `valor` decimal(10,2) NOT NULL,
  `percentual_desconto_view` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_favorito_deliveries`
--

CREATE TABLE `produto_favorito_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_ibpts`
--

CREATE TABLE `produto_ibpts` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `nacional` decimal(5,2) NOT NULL,
  `estadual` decimal(5,2) NOT NULL,
  `importado` decimal(5,2) NOT NULL,
  `municipal` decimal(5,2) NOT NULL,
  `vigencia_inicio` varchar(10) NOT NULL,
  `vigencia_fim` varchar(10) NOT NULL,
  `chave` varchar(10) NOT NULL,
  `versao` varchar(10) NOT NULL,
  `fonte` varchar(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_lista_precos`
--

CREATE TABLE `produto_lista_precos` (
  `id` int(10) UNSIGNED NOT NULL,
  `lista_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `percentual_lucro` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_os`
--

CREATE TABLE `produto_os` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `ordem_servico_id` int(10) UNSIGNED NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_unitario` decimal(16,7) NOT NULL,
  `sub_total` decimal(16,7) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `produto_os`
--

INSERT INTO `produto_os` (`id`, `produto_id`, `ordem_servico_id`, `quantidade`, `valor_unitario`, `sub_total`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 4, 1, 0.0000000, 0.0000000, 0, '2025-01-18 22:28:06', '2025-01-18 22:28:06'),
(5, 1, 5, 1, 0.0000000, 0.0000000, 0, '2025-01-18 23:20:05', '2025-01-18 23:20:05'),
(6, 4, 9, 10, 4.0000000, 40.0000000, 0, '2025-01-25 18:16:04', '2025-01-25 18:16:04'),
(7, 6, 10, 1, 16.5000000, 16.5000000, 0, '2025-01-29 19:17:31', '2025-01-29 19:17:31'),
(9, 7, 10, 3, 4.5000000, 13.5000000, 0, '2025-01-29 19:18:13', '2025-01-29 19:18:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_pizzas`
--

CREATE TABLE `produto_pizzas` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED DEFAULT NULL,
  `tamanho_id` int(10) UNSIGNED DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pushes`
--

CREATE TABLE `pushes` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `titulo` varchar(50) NOT NULL,
  `texto` varchar(100) NOT NULL,
  `path_img` varchar(200) NOT NULL,
  `referencia_produto` int(11) NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `receitas`
--

CREATE TABLE `receitas` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED DEFAULT NULL,
  `descricao` varchar(255) NOT NULL,
  `rendimento` double(8,2) NOT NULL,
  `valor_custo` decimal(10,2) NOT NULL,
  `tempo_preparo` int(11) NOT NULL,
  `pizza` tinyint(1) NOT NULL,
  `pedacos` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `receita_ctes`
--

CREATE TABLE `receita_ctes` (
  `id` int(10) UNSIGNED NOT NULL,
  `cte_id` int(10) UNSIGNED NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `record_logs`
--

CREATE TABLE `record_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo` enum('criar','atualizar','deletar','emissao','cancelamento') NOT NULL,
  `usuario_log_id` int(10) UNSIGNED NOT NULL,
  `tabela` varchar(40) NOT NULL,
  `registro_id` int(11) NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `relatorio_os`
--

CREATE TABLE `relatorio_os` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `ordem_servico_id` int(10) UNSIGNED NOT NULL,
  `texto` text NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `relatorio_os`
--

INSERT INTO `relatorio_os` (`id`, `usuario_id`, `ordem_servico_id`, `texto`, `data_registro`, `created_at`, `updated_at`) VALUES
(3, 3, 5, 'Teste alalalalala', '2025-01-18 23:20:49', '2025-01-18 23:20:49', '2025-01-18 23:20:49'),
(6, 5, 9, 'Efetuar levantamento de estoque\r\nEntrega ao cliente', '2025-01-25 18:18:26', '2025-01-25 18:18:26', '2025-01-25 18:18:26'),
(7, 2, 10, 'O AR ENCONTRA-SE PINGANDO AO LADO DE FORA NO QUINTAL. O AR ENCONTRA-SE NO QUARTO DAS CRIANÇAS PASSANDO A COZINHA DO LADO DIREITO DA ENTRADA.', '2025-01-29 19:08:27', '2025-01-29 19:08:27', '2025-01-29 19:08:27');

-- --------------------------------------------------------

--
-- Estrutura para tabela `remessas`
--

CREATE TABLE `remessas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome_arquivo` varchar(32) NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `remessa_boletos`
--

CREATE TABLE `remessa_boletos` (
  `id` int(10) UNSIGNED NOT NULL,
  `remessa_id` int(10) UNSIGNED NOT NULL,
  `boleto_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `remessa_nfe_faturas`
--

CREATE TABLE `remessa_nfe_faturas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `remessa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipo_pagamento` varchar(30) NOT NULL,
  `valor` decimal(16,7) NOT NULL,
  `data_vencimento` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `remessa_nves`
--

CREATE TABLE `remessa_nves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `filial_id` int(10) UNSIGNED DEFAULT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `natureza_id` int(10) UNSIGNED NOT NULL,
  `transportadora_id` int(10) UNSIGNED DEFAULT NULL,
  `numero_sequencial` int(11) NOT NULL,
  `data_entrega` date DEFAULT NULL,
  `valor_total` decimal(16,7) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `acrescimo` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(2) NOT NULL,
  `observacao` varchar(255) NOT NULL,
  `estado_emissao` enum('novo','rejeitado','cancelado','aprovado') NOT NULL,
  `sequencia_cce` int(11) NOT NULL,
  `nSerie` int(11) NOT NULL DEFAULT 0,
  `numero_nfe` int(11) NOT NULL DEFAULT 0,
  `chave` varchar(48) NOT NULL,
  `descricao_pag_outros` varchar(80) DEFAULT NULL,
  `data_emissao` timestamp NULL DEFAULT NULL,
  `baixa_estoque` tinyint(1) NOT NULL,
  `gerar_conta_receber` tinyint(1) NOT NULL,
  `tipo_nfe` enum('normal','remessa','estorno','entrada') NOT NULL,
  `placa` varchar(9) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `valor_frete` decimal(10,2) DEFAULT NULL,
  `tipo_frete` int(11) DEFAULT NULL,
  `qtd_volumes` int(11) DEFAULT NULL,
  `numeracao_volumes` varchar(20) DEFAULT NULL,
  `especie` varchar(20) DEFAULT NULL,
  `peso_liquido` decimal(8,3) DEFAULT NULL,
  `peso_bruto` decimal(8,3) DEFAULT NULL,
  `data_retroativa` date DEFAULT NULL,
  `venda_caixa_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `remessa_referencia_nves`
--

CREATE TABLE `remessa_referencia_nves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `remessa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chave` varchar(44) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `representantes`
--

CREATE TABLE `representantes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(80) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `cpf_cnpj` varchar(18) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `comissao` decimal(5,2) NOT NULL DEFAULT 0.00,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `acesso_xml` tinyint(1) NOT NULL DEFAULT 0,
  `limite_cadastros` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `representante_empresas`
--

CREATE TABLE `representante_empresas` (
  `id` int(10) UNSIGNED NOT NULL,
  `representante_id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sangria_caixas`
--

CREATE TABLE `sangria_caixas` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `valor` decimal(10,2) NOT NULL,
  `observacao` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(60) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `unidade_cobranca` varchar(5) NOT NULL,
  `tempo_servico` int(11) NOT NULL,
  `tempo_adicional` int(11) NOT NULL DEFAULT 0,
  `tempo_tolerancia` int(11) NOT NULL DEFAULT 0,
  `valor_adicional` decimal(10,2) NOT NULL DEFAULT 0.00,
  `comissao` decimal(6,2) NOT NULL DEFAULT 0.00,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `codigo_servico` varchar(10) DEFAULT NULL,
  `aliquota_iss` decimal(6,2) DEFAULT NULL,
  `aliquota_pis` decimal(6,2) DEFAULT NULL,
  `aliquota_cofins` decimal(6,2) DEFAULT NULL,
  `aliquota_inss` decimal(6,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `servicos`
--

INSERT INTO `servicos` (`id`, `empresa_id`, `nome`, `valor`, `unidade_cobranca`, `tempo_servico`, `tempo_adicional`, `tempo_tolerancia`, `valor_adicional`, `comissao`, `categoria_id`, `codigo_servico`, `aliquota_iss`, `aliquota_pis`, `aliquota_cofins`, `aliquota_inss`, `created_at`, `updated_at`) VALUES
(1, 1, 'Manutenção de Software - Corretiva', 350.00, 'UND', 1440, 0, 0, 0.00, 0.00, 1, NULL, NULL, NULL, NULL, NULL, '2025-01-18 21:44:06', '2025-01-18 21:44:06'),
(2, 2, 'Fornecimento de Picolé', 5.00, 'UND', 60, 0, 0, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, '2025-01-25 18:15:07', '2025-01-25 18:15:07'),
(3, 1, 'MANUTENÇÃO AR CONDICIONADO', 390.00, 'UND', 60, 0, 0, 0.00, 0.00, 2, '0001', NULL, NULL, NULL, NULL, '2025-01-29 19:06:18', '2025-01-29 19:06:18');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico_os`
--

CREATE TABLE `servico_os` (
  `id` int(10) UNSIGNED NOT NULL,
  `servico_id` int(10) UNSIGNED NOT NULL,
  `ordem_servico_id` int(10) UNSIGNED NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_unitario` decimal(16,7) NOT NULL,
  `sub_total` decimal(16,7) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `servico_os`
--

INSERT INTO `servico_os` (`id`, `servico_id`, `ordem_servico_id`, `quantidade`, `valor_unitario`, `sub_total`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 4, 1, 350.0000000, 350.0000000, 0, '2025-01-18 22:27:50', '2025-01-18 22:27:50'),
(3, 1, 5, 1, 350.0000000, 350.0000000, 0, '2025-01-18 23:19:42', '2025-01-18 23:19:42'),
(4, 2, 9, 1, 5.0000000, 5.0000000, 0, '2025-01-25 18:15:38', '2025-01-25 18:15:38'),
(5, 3, 10, 1, 390.0000000, 390.0000000, 1, '2025-01-29 19:06:49', '2025-01-29 19:21:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sub_categorias`
--

CREATE TABLE `sub_categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `sub_categorias`
--

INSERT INTO `sub_categorias` (`id`, `categoria_id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 1, 'ERP', '2025-01-18 19:37:36', '2025-01-18 19:37:36'),
(2, 3, 'Inteira', '2025-01-19 03:13:22', '2025-01-19 03:13:22');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sub_categoria_ecommerces`
--

CREATE TABLE `sub_categoria_ecommerces` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `suprimento_caixas`
--

CREATE TABLE `suprimento_caixas` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `observacao` varchar(50) NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `system_updates`
--

CREATE TABLE `system_updates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tamanho_pizzas`
--

CREATE TABLE `tamanho_pizzas` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) NOT NULL,
  `pedacos` int(11) NOT NULL,
  `maximo_sabores` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tela_pedidos`
--

CREATE TABLE `tela_pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) NOT NULL,
  `alerta_amarelo` int(11) NOT NULL DEFAULT 0,
  `alerta_vermelho` int(11) NOT NULL DEFAULT 0,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tema_usuarios`
--

CREATE TABLE `tema_usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `tema` varchar(20) DEFAULT NULL,
  `cabecalho` varchar(30) DEFAULT NULL,
  `plano_fundo` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `tema_usuarios`
--

INSERT INTO `tema_usuarios` (`id`, `usuario_id`, `tema`, `cabecalho`, `plano_fundo`, `created_at`, `updated_at`) VALUES
(1, 3, 'semi-dark', 'headercolor2', 'sidebarcolor3', '2025-01-19 00:34:29', '2025-01-19 00:35:16'),
(2, 2, NULL, 'headercolor2', 'sidebarcolor3', '2025-01-19 00:36:25', '2025-01-25 16:57:49');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `estado` enum('aberto','respondida','finalizado') NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `assunto` varchar(100) NOT NULL,
  `mensagem_finalizar` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ticket_mensagems`
--

CREATE TABLE `ticket_mensagems` (
  `id` int(10) UNSIGNED NOT NULL,
  `imagem` varchar(50) NOT NULL,
  `mensagem` text NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `token_cliente_deliveries`
--

CREATE TABLE `token_cliente_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `token` varchar(200) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `token_webs`
--

CREATE TABLE `token_webs` (
  `id` int(10) UNSIGNED NOT NULL,
  `token` varchar(200) NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `transportadoras`
--

CREATE TABLE `transportadoras` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `razao_social` varchar(100) NOT NULL,
  `cnpj_cpf` varchar(19) NOT NULL DEFAULT '000.000.000-00',
  `logradouro` varchar(80) NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(40) NOT NULL DEFAULT '',
  `telefone` varchar(20) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tributacaos`
--

CREATE TABLE `tributacaos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `icms` decimal(4,2) NOT NULL,
  `pis` decimal(4,2) NOT NULL,
  `cofins` decimal(4,2) NOT NULL,
  `ipi` decimal(4,2) NOT NULL,
  `perc_ap_cred` decimal(5,2) NOT NULL,
  `ncm_padrao` varchar(10) NOT NULL DEFAULT '0000.00.00',
  `link_nfse` varchar(200) NOT NULL DEFAULT '',
  `regime` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `tributacaos`
--

INSERT INTO `tributacaos` (`id`, `empresa_id`, `icms`, `pis`, `cofins`, `ipi`, `perc_ap_cred`, `ncm_padrao`, `link_nfse`, `regime`, `created_at`, `updated_at`) VALUES
(1, 1, 0.00, 0.00, 0.00, 0.00, 0.00, '0000.00.00', '', '2', '2025-01-18 19:35:46', '2025-01-18 19:35:46'),
(2, 2, 0.00, 0.00, 0.00, 0.00, 0.00, '0000.00.00', '', '', '2025-01-25 17:03:01', '2025-01-25 17:03:01'),
(3, 3, 0.00, 0.00, 0.00, 0.00, 0.00, '0000.00.00', '', '', '2025-02-07 00:28:14', '2025-02-07 00:28:14');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tributacao_ufs`
--

CREATE TABLE `tributacao_ufs` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `uf` varchar(2) NOT NULL,
  `percentual_icms` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `troca_vendas`
--

CREATE TABLE `troca_vendas` (
  `id` int(10) UNSIGNED NOT NULL,
  `venda_id` int(11) NOT NULL,
  `tipo` enum('pedido','pdv') NOT NULL,
  `valor_total` decimal(16,7) NOT NULL,
  `valor_credito` decimal(16,7) NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `data_venda` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `troca_venda_caixas`
--

CREATE TABLE `troca_venda_caixas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `antiga_venda_caixas_id` int(10) UNSIGNED NOT NULL,
  `nova_venda_caixas_id` int(10) UNSIGNED NOT NULL,
  `prod_removidos` text NOT NULL,
  `prod_adicionados` text NOT NULL,
  `observacao` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `troca_venda_items`
--

CREATE TABLE `troca_venda_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `troca_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `valor` decimal(16,7) NOT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidade_cargas`
--

CREATE TABLE `unidade_cargas` (
  `id` int(10) UNSIGNED NOT NULL,
  `info_id` int(10) UNSIGNED NOT NULL,
  `id_unidade_carga` varchar(20) NOT NULL,
  `quantidade_rateio` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `adm` tinyint(1) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `email` varchar(200) NOT NULL,
  `img` varchar(100) NOT NULL DEFAULT '',
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `somente_fiscal` tinyint(1) NOT NULL DEFAULT 0,
  `caixa_livre` tinyint(1) NOT NULL DEFAULT 0,
  `permite_desconto` tinyint(1) NOT NULL DEFAULT 1,
  `menu_representante` tinyint(1) NOT NULL DEFAULT 0,
  `permissao` text NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `tema` int(11) NOT NULL DEFAULT 1,
  `tema_menu` int(11) NOT NULL DEFAULT 1,
  `tipo_menu` varchar(20) NOT NULL DEFAULT 'lateral',
  `rota_acesso` varchar(150) NOT NULL DEFAULT '',
  `locais` text DEFAULT NULL,
  `local_padrao` int(11) DEFAULT NULL,
  `aviso_sonoro` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `login`, `adm`, `senha`, `email`, `img`, `ativo`, `somente_fiscal`, `caixa_livre`, `permite_desconto`, `menu_representante`, `permissao`, `empresa_id`, `tema`, `tema_menu`, `tipo_menu`, `rota_acesso`, `locais`, `local_padrao`, `aviso_sonoro`, `created_at`, `updated_at`) VALUES
(2, 'Jonathan Crecencio', 'joncrecencio', 1, '7d0ab26187d6e4d9277b4f3b5b35bb98', 'jonathancrecencio@outlook.com', '4yMii1HbroVHBjQL2V8UXCKpT.jpg', 1, 1, 1, 1, 0, '[\"http:\\/\\/127.0.0.1:8000\\/categorias\",\"http:\\/\\/127.0.0.1:8000\\/marcas\",\"http:\\/\\/127.0.0.1:8000\\/produtos\",\"http:\\/\\/127.0.0.1:8000\\/clientes\",\"http:\\/\\/127.0.0.1:8000\\/gruposCliente\",\"http:\\/\\/127.0.0.1:8000\\/acessores\",\"http:\\/\\/127.0.0.1:8000\\/fornecedores\",\"http:\\/\\/127.0.0.1:8000\\/transportadoras\",\"http:\\/\\/127.0.0.1:8000\\/categoria-servico\",\"http:\\/\\/127.0.0.1:8000\\/servicos\",\"http:\\/\\/127.0.0.1:8000\\/listaDePrecos\",\"http:\\/\\/127.0.0.1:8000\\/categoria-conta\",\"http:\\/\\/127.0.0.1:8000\\/veiculos\",\"http:\\/\\/127.0.0.1:8000\\/contaBancaria\",\"http:\\/\\/127.0.0.1:8000\\/formasPagamento\",\"http:\\/\\/127.0.0.1:8000\\/usuarios\",\"http:\\/\\/127.0.0.1:8000\\/compraFiscal\",\"http:\\/\\/127.0.0.1:8000\\/compraManual\",\"http:\\/\\/127.0.0.1:8000\\/compras\",\"http:\\/\\/127.0.0.1:8000\\/cotacao\",\"http:\\/\\/127.0.0.1:8000\\/dfe\",\"http:\\/\\/127.0.0.1:8000\\/devolucao\",\"http:\\/\\/127.0.0.1:8000\\/funcionarios\",\"http:\\/\\/127.0.0.1:8000\\/eventoSalario\",\"http:\\/\\/127.0.0.1:8000\\/funcionarioEventos\",\"http:\\/\\/127.0.0.1:8000\\/apuracaoMensal\",\"http:\\/\\/127.0.0.1:8000\\/estoque\",\"http:\\/\\/127.0.0.1:8000\\/estoque\\/apontamentoProducao\",\"http:\\/\\/127.0.0.1:8000\\/inventario\",\"http:\\/\\/127.0.0.1:8000\\/caixa\",\"http:\\/\\/127.0.0.1:8000\\/vendas\\/create\",\"http:\\/\\/127.0.0.1:8000\\/vendas\",\"http:\\/\\/127.0.0.1:8000\\/frenteCaixa\\/list\",\"http:\\/\\/127.0.0.1:8000\\/frenteCaixa\",\"http:\\/\\/127.0.0.1:8000\\/orcamentoVenda\",\"http:\\/\\/127.0.0.1:8000\\/preVenda\",\"http:\\/\\/127.0.0.1:8000\\/ordemServico\",\"http:\\/\\/127.0.0.1:8000\\/agendamentos\",\"http:\\/\\/127.0.0.1:8000\\/nferemessa\",\"http:\\/\\/127.0.0.1:8000\\/conta-pagar\",\"http:\\/\\/127.0.0.1:8000\\/conta-receber\",\"http:\\/\\/127.0.0.1:8000\\/fluxoCaixa\",\"http:\\/\\/127.0.0.1:8000\\/graficos\",\"http:\\/\\/127.0.0.1:8000\\/cte\",\"http:\\/\\/127.0.0.1:8000\\/cte\\/create\",\"http:\\/\\/127.0.0.1:8000\\/categoriaDespesa\",\"http:\\/\\/127.0.0.1:8000\\/cteOs\",\"http:\\/\\/127.0.0.1:8000\\/cteOs\\/create\",\"http:\\/\\/127.0.0.1:8000\\/relatorios\",\"http:\\/\\/127.0.0.1:8000\\/dre\",\"http:\\/\\/127.0.0.1:8000\\/locacao\\/create\",\"http:\\/\\/127.0.0.1:8000\\/locacao\",\"http:\\/\\/127.0.0.1:8000\\/pedidos\",\"http:\\/\\/127.0.0.1:8000\\/deliveryComplemento\",\"\\/telasPedido\",\"http:\\/\\/127.0.0.1:8000\\/controleCozinha\\/selecionar\",\"http:\\/\\/127.0.0.1:8000\\/mesas\",\"http:\\/\\/127.0.0.1:8000\\/pedidos\\/controleComandas\",\"http:\\/\\/127.0.0.1:8000\\/configNF\",\"http:\\/\\/127.0.0.1:8000\\/escritorio\",\"http:\\/\\/127.0.0.1:8000\\/naturezas\",\"http:\\/\\/127.0.0.1:8000\\/tributos\",\"http:\\/\\/127.0.0.1:8000\\/enviarXml\",\"http:\\/\\/127.0.0.1:8000\\/tickets\"]', 1, 1, 1, 'lateral', '', NULL, 0, 0, '2025-01-18 17:55:32', '2025-01-19 02:58:50'),
(3, 'Gabrielle Freire Martins', 'gmartins', 1, 'e10adc3949ba59abbe56e057f20f883e', 'gabriellefreiremartins@gmail.com', '', 1, 1, 0, 1, 0, '[\"http:\\/\\/127.0.0.1:8000\\/categorias\",\"http:\\/\\/127.0.0.1:8000\\/marcas\",\"http:\\/\\/127.0.0.1:8000\\/produtos\",\"http:\\/\\/127.0.0.1:8000\\/clientes\",\"http:\\/\\/127.0.0.1:8000\\/fornecedores\",\"http:\\/\\/127.0.0.1:8000\\/transportadoras\",\"http:\\/\\/127.0.0.1:8000\\/categoria-servico\",\"http:\\/\\/127.0.0.1:8000\\/servicos\",\"http:\\/\\/127.0.0.1:8000\\/listaDePrecos\",\"http:\\/\\/127.0.0.1:8000\\/categoria-conta\",\"http:\\/\\/127.0.0.1:8000\\/veiculos\",\"http:\\/\\/127.0.0.1:8000\\/formasPagamento\",\"http:\\/\\/127.0.0.1:8000\\/usuarios\",\"http:\\/\\/127.0.0.1:8000\\/compraFiscal\",\"http:\\/\\/127.0.0.1:8000\\/compraManual\",\"http:\\/\\/127.0.0.1:8000\\/compras\",\"http:\\/\\/127.0.0.1:8000\\/cotacao\",\"http:\\/\\/127.0.0.1:8000\\/dfe\",\"http:\\/\\/127.0.0.1:8000\\/devolucao\",\"http:\\/\\/127.0.0.1:8000\\/funcionarios\",\"http:\\/\\/127.0.0.1:8000\\/eventoSalario\",\"http:\\/\\/127.0.0.1:8000\\/funcionarioEventos\",\"http:\\/\\/127.0.0.1:8000\\/apuracaoMensal\",\"http:\\/\\/127.0.0.1:8000\\/estoque\",\"http:\\/\\/127.0.0.1:8000\\/estoque\\/apontamentoProducao\",\"http:\\/\\/127.0.0.1:8000\\/inventario\",\"http:\\/\\/127.0.0.1:8000\\/caixa\",\"http:\\/\\/127.0.0.1:8000\\/vendas\\/create\",\"http:\\/\\/127.0.0.1:8000\\/vendas\",\"http:\\/\\/127.0.0.1:8000\\/frenteCaixa\\/list\",\"http:\\/\\/127.0.0.1:8000\\/frenteCaixa\",\"http:\\/\\/127.0.0.1:8000\\/orcamentoVenda\",\"http:\\/\\/127.0.0.1:8000\\/preVenda\",\"http:\\/\\/127.0.0.1:8000\\/ordemServico\",\"http:\\/\\/127.0.0.1:8000\\/agendamentos\",\"http:\\/\\/127.0.0.1:8000\\/nferemessa\",\"http:\\/\\/127.0.0.1:8000\\/conta-pagar\",\"http:\\/\\/127.0.0.1:8000\\/conta-receber\",\"http:\\/\\/127.0.0.1:8000\\/fluxoCaixa\",\"http:\\/\\/127.0.0.1:8000\\/graficos\",\"http:\\/\\/127.0.0.1:8000\\/cte\",\"http:\\/\\/127.0.0.1:8000\\/cte\\/create\",\"http:\\/\\/127.0.0.1:8000\\/categoriaDespesa\",\"http:\\/\\/127.0.0.1:8000\\/cteOs\",\"http:\\/\\/127.0.0.1:8000\\/cteOs\\/create\",\"http:\\/\\/127.0.0.1:8000\\/relatorios\",\"http:\\/\\/127.0.0.1:8000\\/dre\",\"http:\\/\\/127.0.0.1:8000\\/locacao\\/create\",\"http:\\/\\/127.0.0.1:8000\\/locacao\",\"http:\\/\\/127.0.0.1:8000\\/pedidos\",\"http:\\/\\/127.0.0.1:8000\\/deliveryComplemento\",\"\\/telasPedido\",\"http:\\/\\/127.0.0.1:8000\\/controleCozinha\\/selecionar\",\"http:\\/\\/127.0.0.1:8000\\/mesas\",\"http:\\/\\/127.0.0.1:8000\\/pedidos\\/controleComandas\",\"http:\\/\\/127.0.0.1:8000\\/configNF\",\"http:\\/\\/127.0.0.1:8000\\/escritorio\",\"http:\\/\\/127.0.0.1:8000\\/naturezas\",\"http:\\/\\/127.0.0.1:8000\\/tributos\",\"http:\\/\\/127.0.0.1:8000\\/enviarXml\",\"http:\\/\\/127.0.0.1:8000\\/tickets\"]', 1, 1, 1, 'lateral', '', NULL, 0, 0, '2025-01-18 19:14:22', '2025-01-25 17:47:09'),
(5, 'caaso', 'caaso', 1, 'e10adc3949ba59abbe56e057f20f883e', 'caaso.eng@gmail.com', '', 1, 0, 0, 1, 1, '[\"http:\\/\\/127.0.0.1:8000\\/categorias\",\"http:\\/\\/127.0.0.1:8000\\/marcas\",\"http:\\/\\/127.0.0.1:8000\\/produtos\",\"http:\\/\\/127.0.0.1:8000\\/clientes\",\"http:\\/\\/127.0.0.1:8000\\/fornecedores\",\"http:\\/\\/127.0.0.1:8000\\/categoria-servico\",\"http:\\/\\/127.0.0.1:8000\\/servicos\",\"http:\\/\\/127.0.0.1:8000\\/formasPagamento\",\"http:\\/\\/127.0.0.1:8000\\/usuarios\",\"http:\\/\\/127.0.0.1:8000\\/compraFiscal\",\"http:\\/\\/127.0.0.1:8000\\/compraManual\",\"http:\\/\\/127.0.0.1:8000\\/compras\",\"http:\\/\\/127.0.0.1:8000\\/devolucao\",\"http:\\/\\/127.0.0.1:8000\\/funcionarios\",\"http:\\/\\/127.0.0.1:8000\\/estoque\",\"http:\\/\\/127.0.0.1:8000\\/estoque\\/apontamentoProducao\",\"http:\\/\\/127.0.0.1:8000\\/inventario\",\"http:\\/\\/127.0.0.1:8000\\/caixa\",\"http:\\/\\/127.0.0.1:8000\\/vendas\\/create\",\"http:\\/\\/127.0.0.1:8000\\/vendas\",\"http:\\/\\/127.0.0.1:8000\\/frenteCaixa\\/list\",\"http:\\/\\/127.0.0.1:8000\\/frenteCaixa\",\"http:\\/\\/127.0.0.1:8000\\/orcamentoVenda\",\"http:\\/\\/127.0.0.1:8000\\/preVenda\",\"http:\\/\\/127.0.0.1:8000\\/conta-pagar\",\"http:\\/\\/127.0.0.1:8000\\/conta-receber\",\"http:\\/\\/127.0.0.1:8000\\/fluxoCaixa\",\"http:\\/\\/127.0.0.1:8000\\/graficos\",\"http:\\/\\/127.0.0.1:8000\\/relatorios\",\"http:\\/\\/127.0.0.1:8000\\/pedidos\",\"http:\\/\\/127.0.0.1:8000\\/pedidos\\/controleComandas\",\"http:\\/\\/127.0.0.1:8000\\/configNF\",\"http:\\/\\/127.0.0.1:8000\\/escritorio\",\"http:\\/\\/127.0.0.1:8000\\/naturezas\",\"http:\\/\\/127.0.0.1:8000\\/tributos\",\"http:\\/\\/127.0.0.1:8000\\/enviarXml\",\"http:\\/\\/127.0.0.1:8000\\/tickets\"]', 2, 1, 1, 'lateral', '', NULL, 0, 0, '2025-01-25 17:03:00', '2025-01-25 18:57:40'),
(6, 'João Felipe Das Neves', 'joaofelipe', 0, 'e10adc3949ba59abbe56e057f20f883e', 'teste@teste.com', '', 1, 1, 0, 1, 0, '[\"http:\\/\\/127.0.0.1:8000\\/caixa\",\"http:\\/\\/127.0.0.1:8000\\/vendas\\/create\",\"http:\\/\\/127.0.0.1:8000\\/frenteCaixa\",\"http:\\/\\/127.0.0.1:8000\\/pedidos\"]', 2, 1, 1, 'lateral', 'http://127.0.0.1:8000/caixa', NULL, 0, 1, '2025-01-25 17:28:19', '2025-01-25 19:03:29'),
(7, 'Renata Teixeira', 'renatateixeira', 1, '860c6d6d6c82a25147a6bb7312fbd3a7', 'renata.deus@gmail.com', '', 1, 0, 0, 1, 1, '[\"http:\\/\\/127.0.0.1:8000\\/clientes\",\"http:\\/\\/127.0.0.1:8000\\/usuarios\"]', 3, 1, 1, 'lateral', 'http://127.0.0.1:8000/clientes', NULL, 0, 0, '2025-02-07 00:28:13', '2025-02-07 00:32:59');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_acessos`
--

CREATE TABLE `usuario_acessos` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `hash` varchar(20) NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `usuario_acessos`
--

INSERT INTO `usuario_acessos` (`id`, `status`, `usuario_id`, `hash`, `ip_address`, `created_at`, `updated_at`) VALUES
(3, 1, 2, 'eB9m6P3vf0UF59WkSIFM', '127.0.0.1', '2025-01-18 18:50:36', '2025-01-18 18:52:56'),
(4, 1, 2, 'ypc5uVIhOxEcan64YBlk', '127.0.0.1', '2025-01-18 18:53:05', '2025-01-25 17:28:23'),
(5, 1, 3, 'u0tVPDvgqqRJ1eBqPqc0', '127.0.0.1', '2025-01-18 19:23:26', '2025-01-18 19:24:36'),
(8, 1, 3, 'R1XsTbIArnCX8vyvbdLg', '127.0.0.1', '2025-01-18 19:32:13', '2025-01-18 19:55:53'),
(9, 1, 2, 'dsUw2Sr3AQlYYVPEYhpD', '127.0.0.1', '2025-01-18 20:02:19', '2025-01-25 17:28:25'),
(10, 1, 3, 'zxYGNbepwHb8smcDuaF2', '127.0.0.1', '2025-01-18 20:03:11', '2025-01-19 01:43:19'),
(11, 1, 3, 'qx2npJjOJmTlPRUPJVgY', '127.0.0.1', '2025-01-18 22:33:40', '2025-01-19 01:43:19'),
(12, 1, 3, 'cO4kho5VOFSUD5aFgh5S', '127.0.0.1', '2025-01-19 01:42:10', '2025-01-19 01:43:19'),
(13, 1, 2, 'fi85U6guxtCGFSEXv70Q', '127.0.0.1', '2025-01-19 01:43:28', '2025-01-25 17:28:25'),
(14, 1, 2, 'RzCk50fK3mQuCFVQyeqS', '127.0.0.1', '2025-01-19 02:17:36', '2025-01-25 17:28:25'),
(15, 1, 2, 'cldOU7knoKD3vQLXPECc', '127.0.0.1', '2025-01-19 02:37:44', '2025-01-25 17:28:26'),
(16, 1, 2, 'UqBqmakERixJ83SEV81T', '127.0.0.1', '2025-01-19 03:12:04', '2025-01-25 17:28:26'),
(17, 1, 2, '9LkPnQ5KMvsM5nuTQqkK', '127.0.0.1', '2025-01-25 16:55:22', '2025-01-25 17:28:26'),
(18, 0, 5, 'wHrWdsfxTW28xr4mvgLt', '127.0.0.1', '2025-01-25 17:06:28', '2025-01-25 19:03:29'),
(19, 1, 2, 'CDmcsED6lD2eHRAJlek7', '127.0.0.1', '2025-01-25 17:14:07', '2025-01-25 17:28:26'),
(20, 1, 6, 'GJms0M3XWaqpmS7IZuFe', '127.0.0.1', '2025-01-25 17:28:35', '2025-01-25 17:33:28'),
(21, 1, 2, 'kvG5rOpAyYOw7btJqYZX', '127.0.0.1', '2025-01-25 17:33:39', '2025-01-25 17:47:20'),
(22, 1, 3, '0onzhsmnBcm4Q0Rc4X54', '127.0.0.1', '2025-01-25 17:47:28', '2025-01-25 18:55:37'),
(23, 1, 2, 'VKn9oxbJuvqbgUKlIRxZ', '127.0.0.1', '2025-01-25 18:55:46', '2025-01-25 19:02:24'),
(24, 0, 6, 'qzdzmhjUAWPKdQLMaEjy', '127.0.0.1', '2025-01-25 19:02:28', '2025-01-25 19:02:28'),
(25, 0, 6, '51NA3sXDWtuL3mZsDBYj', '127.0.0.1', '2025-01-25 19:03:50', '2025-01-25 19:07:06'),
(26, 1, 2, 'j7N2fkA1u95PPwJ4aZNM', '127.0.0.1', '2025-01-29 18:15:50', '2025-02-07 00:30:39'),
(27, 1, 2, 'qyuwb2pX8CchyMuYWL82', '127.0.0.1', '2025-02-06 23:48:26', '2025-02-07 00:30:40'),
(28, 1, 7, 'dTDYzH9sCzwbuF7ymPus', '127.0.0.1', '2025-02-07 00:30:40', '2025-02-07 01:27:01'),
(29, 0, 2, '1N561r11GUEJv3hjQA5Y', '127.0.0.1', '2025-02-07 00:31:55', '2025-02-07 01:28:21'),
(30, 0, 2, 'NKiDlZYQPEz0z9DM5sxA', '127.0.0.1', '2025-02-20 18:30:00', '2025-02-20 18:43:36'),
(31, 0, 2, '1LSCnW2seis4TArDoHyZ', '127.0.0.1', '2025-04-08 00:30:13', '2025-04-08 00:30:14');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vale_pedagios`
--

CREATE TABLE `vale_pedagios` (
  `id` int(10) UNSIGNED NOT NULL,
  `mdfe_id` int(10) UNSIGNED NOT NULL,
  `cnpj_fornecedor` varchar(18) NOT NULL,
  `cnpj_fornecedor_pagador` varchar(18) NOT NULL,
  `numero_compra` varchar(18) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `placa` varchar(8) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `cor` varchar(10) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `rntrc` varchar(12) NOT NULL,
  `renavam` varchar(12) NOT NULL,
  `TAF` varchar(14) NOT NULL,
  `numero_registro_estadual` varchar(30) NOT NULL,
  `tipo` varchar(2) NOT NULL,
  `tipo_carroceria` varchar(2) NOT NULL,
  `tipo_rodado` varchar(2) NOT NULL,
  `tara` varchar(10) NOT NULL,
  `capacidade` varchar(10) NOT NULL,
  `proprietario_documento` varchar(20) NOT NULL,
  `proprietario_nome` varchar(40) NOT NULL,
  `proprietario_ie` varchar(13) NOT NULL,
  `proprietario_uf` varchar(2) NOT NULL,
  `proprietario_tp` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `natureza_id` int(10) UNSIGNED NOT NULL,
  `frete_id` int(10) UNSIGNED DEFAULT NULL,
  `transportadora_id` int(10) UNSIGNED DEFAULT NULL,
  `filial_id` int(10) UNSIGNED DEFAULT NULL,
  `nSerie` int(11) NOT NULL DEFAULT 0,
  `data_emissao` timestamp NULL DEFAULT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_entrega` date DEFAULT NULL,
  `valor_total` decimal(16,7) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `acrescimo` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) NOT NULL,
  `tipo_pagamento` varchar(2) NOT NULL,
  `observacao` varchar(255) NOT NULL,
  `numero_nfe` int(11) NOT NULL DEFAULT 0,
  `estado_emissao` enum('novo','aprovado','rejeitado','cancelado') NOT NULL,
  `chave` varchar(48) NOT NULL,
  `sequencia_cce` int(11) NOT NULL,
  `pedido_ecommerce_id` int(11) NOT NULL DEFAULT 0,
  `pedido_nuvemshop_id` int(11) NOT NULL DEFAULT 0,
  `bandeira_cartao` varchar(2) NOT NULL DEFAULT '99',
  `cnpj_cartao` varchar(18) NOT NULL DEFAULT '',
  `cAut_cartao` varchar(20) NOT NULL DEFAULT '',
  `descricao_pag_outros` varchar(80) NOT NULL DEFAULT '',
  `contigencia` tinyint(1) NOT NULL DEFAULT 0,
  `reenvio_contigencia` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `vendas`
--

INSERT INTO `vendas` (`id`, `empresa_id`, `cliente_id`, `usuario_id`, `natureza_id`, `frete_id`, `transportadora_id`, `filial_id`, `nSerie`, `data_emissao`, `data_registro`, `data_entrega`, `valor_total`, `desconto`, `acrescimo`, `forma_pagamento`, `tipo_pagamento`, `observacao`, `numero_nfe`, `estado_emissao`, `chave`, `sequencia_cce`, `pedido_ecommerce_id`, `pedido_nuvemshop_id`, `bandeira_cartao`, `cnpj_cartao`, `cAut_cartao`, `descricao_pag_outros`, `contigencia`, `reenvio_contigencia`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 1, NULL, NULL, NULL, 0, NULL, '2025-01-18 19:45:55', NULL, 2400.0000000, 1200.00, 0.00, 'a_vista', '17', '', 0, 'aprovado', '0', 0, 0, 0, '99', '', '', '', 0, 0, '2025-01-18 19:45:55', '2025-01-18 21:23:20'),
(2, 1, 1, 3, 1, NULL, NULL, NULL, 0, NULL, '2025-01-18 19:52:08', '2025-01-18', 2400.0000000, 1200.00, 0.00, 'a_vista', '17', '', 0, 'aprovado', '0', 0, 0, 0, '99', '', '', '', 0, 0, '2025-01-18 19:52:08', '2025-01-18 21:23:05'),
(3, 1, 1, 3, 1, NULL, NULL, NULL, 0, NULL, '2025-01-18 20:16:46', NULL, 2400.0000000, 0.00, 0.00, 'a_vista', '17', '', 0, 'aprovado', '0', 0, 0, 0, '99', '', '', '', 0, 0, '2025-01-18 20:16:46', '2025-01-18 21:20:15'),
(4, 1, 1, 2, 1, NULL, NULL, NULL, 0, NULL, '2025-01-18 23:37:09', '2025-01-18', 2400.0000000, 0.00, 0.00, 'personalizado', '03', '', 0, 'aprovado', '0', 0, 0, 0, '99', '', '', '', 0, 0, '2025-01-18 23:37:09', '2025-01-18 23:46:44'),
(5, 1, 1, 2, 1, NULL, NULL, NULL, 0, NULL, '2025-01-18 23:39:02', '2025-01-18', 2400.0000000, 2300.00, 0.00, 'personalizado', '03', '', 0, 'aprovado', '0', 0, 0, 0, '99', '', '', '', 0, 0, '2025-01-18 23:39:02', '2025-01-18 23:46:56'),
(6, 1, 1, 2, 1, NULL, NULL, NULL, 0, NULL, '2025-01-18 23:45:12', '2025-01-18', 2400.0000000, 0.00, 0.00, 'personalizado', '03', '', 0, 'aprovado', '0', 0, 0, 0, '99', '', '', '', 0, 0, '2025-01-18 23:45:12', '2025-01-18 23:47:08'),
(7, 1, 1, 2, 1, NULL, NULL, NULL, 0, NULL, '2025-01-19 03:22:54', '2025-01-19', 48.9000000, 0.00, 0.00, 'a_vista', '04', '', 0, 'aprovado', '0', 0, 0, 0, '99', '', '', '', 0, 0, '2025-01-19 03:22:54', '2025-01-19 03:23:13'),
(8, 1, 1, 3, 1, NULL, NULL, NULL, 0, NULL, '2025-01-25 18:07:52', NULL, 2400.0000000, 0.00, 0.00, 'a_vista', '04', '', 0, 'aprovado', '0', 0, 0, 0, '99', '', '', '', 0, 0, '2025-01-25 18:07:52', '2025-01-25 18:08:39'),
(9, 2, 2, 5, 2, NULL, NULL, NULL, 0, NULL, '2025-01-25 18:09:45', NULL, 140.0000000, 0.00, 0.00, 'a_vista', '01', '', 0, 'novo', '', 0, 0, 0, '99', '', '', '', 0, 0, '2025-01-25 18:09:45', '2025-01-25 18:09:45');

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda_caixas`
--

CREATE TABLE `venda_caixas` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `natureza_id` int(10) UNSIGNED NOT NULL,
  `filial_id` int(10) UNSIGNED DEFAULT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `valor_total` decimal(16,7) NOT NULL,
  `dinheiro_recebido` decimal(10,2) NOT NULL,
  `troco` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `acrescimo` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) NOT NULL,
  `tipo_pagamento` varchar(2) NOT NULL,
  `estado_emissao` enum('novo','aprovado','rejeitado','cancelado') NOT NULL,
  `numero_nfce` int(11) DEFAULT NULL,
  `chave` varchar(48) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cpf` varchar(18) DEFAULT NULL,
  `observacao` varchar(150) DEFAULT NULL,
  `pedido_delivery_id` int(11) DEFAULT NULL,
  `qr_code_base64` text DEFAULT NULL,
  `bandeira_cartao` varchar(2) NOT NULL DEFAULT '99',
  `cnpj_cartao` varchar(18) DEFAULT NULL,
  `cAut_cartao` varchar(20) DEFAULT NULL,
  `descricao_pag_outros` varchar(80) DEFAULT NULL,
  `rascunho` tinyint(1) NOT NULL DEFAULT 0,
  `consignado` tinyint(1) NOT NULL DEFAULT 0,
  `pdv_java` tinyint(1) NOT NULL DEFAULT 0,
  `retorno_estoque` tinyint(1) NOT NULL DEFAULT 0,
  `contigencia` tinyint(1) NOT NULL DEFAULT 0,
  `reenvio_contigencia` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `venda_caixas`
--

INSERT INTO `venda_caixas` (`id`, `empresa_id`, `cliente_id`, `usuario_id`, `natureza_id`, `filial_id`, `data_registro`, `valor_total`, `dinheiro_recebido`, `troco`, `desconto`, `acrescimo`, `forma_pagamento`, `tipo_pagamento`, `estado_emissao`, `numero_nfce`, `chave`, `nome`, `cpf`, `observacao`, `pedido_delivery_id`, `qr_code_base64`, `bandeira_cartao`, `cnpj_cartao`, `cAut_cartao`, `descricao_pag_outros`, `rascunho`, `consignado`, `pdv_java`, `retorno_estoque`, `contigencia`, `reenvio_contigencia`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 3, 1, NULL, '2025-01-18 21:21:57', 1200.0000000, 1200.00, 0.00, 1200.00, 0.00, '', '01', 'novo', NULL, '0', NULL, '', '', 0, '0', '', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-18 21:21:57', '2025-01-18 21:21:57'),
(5, 1, NULL, 3, 1, NULL, '2025-01-18 21:22:30', 2400.0000000, 0.00, 0.00, 0.00, 0.00, '', '03', 'novo', NULL, '0', NULL, '', '', 0, '0', '01', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-18 21:22:30', '2025-01-18 21:22:30'),
(6, 1, NULL, 2, 1, NULL, '2025-01-19 03:11:36', 2400.0000000, 0.00, 0.00, 0.00, 0.00, '', '03', 'novo', NULL, '0', NULL, '', '', 0, '0', '01', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-19 03:11:36', '2025-01-19 03:11:36'),
(7, 1, NULL, 2, 1, NULL, '2025-01-19 03:16:13', 2400.0000000, 0.00, 0.00, 0.00, 0.00, '', '17', 'novo', NULL, '0', NULL, '', '', 0, '0', '', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-19 03:16:13', '2025-01-19 03:16:13'),
(8, 2, 2, 6, 2, NULL, '2025-01-25 17:32:25', 30.0000000, 0.00, 0.00, 2.00, 0.00, '', '99', 'novo', NULL, '0', NULL, '', '', 0, '0', '', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-25 17:32:25', '2025-01-25 17:32:25'),
(9, 1, NULL, 2, 1, NULL, '2025-01-25 17:36:29', 2400.0000000, 0.00, 0.00, 0.00, 0.00, '', '04', 'novo', NULL, '0', NULL, '', '', 0, '0', '01', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-25 17:36:29', '2025-01-25 17:36:29'),
(10, 1, NULL, 2, 1, NULL, '2025-01-25 17:39:19', 2400.0000000, 0.00, 0.00, 0.00, 0.00, '', '04', 'novo', NULL, '0', NULL, '', '', 0, '0', '02', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-25 17:39:19', '2025-01-25 17:39:19'),
(11, 1, NULL, 3, 1, NULL, '2025-01-25 17:48:58', 2400.0000000, 0.00, 0.00, 0.00, 0.00, '', '04', 'novo', NULL, '0', NULL, '', '', 0, '0', '01', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-25 17:48:58', '2025-01-25 17:48:58'),
(12, 2, NULL, 5, 2, NULL, '2025-01-25 17:51:55', 200.0000000, 200.00, 0.00, 0.00, 0.00, '', '01', 'novo', NULL, '0', NULL, '', '', 0, '0', '01', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-25 17:51:55', '2025-01-25 17:51:55'),
(13, 1, NULL, 3, 1, NULL, '2025-01-25 18:06:11', 2400.0000000, 0.00, 0.00, 0.00, 0.00, '', '04', 'novo', NULL, '0', NULL, '', '', 0, '0', '01', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-25 18:06:11', '2025-01-25 18:06:11'),
(14, 2, 2, 5, 2, NULL, '2025-01-25 18:11:52', 4.0000000, 10.00, 0.00, 0.00, 0.00, '', '01', 'novo', NULL, '0', NULL, '', '', 0, '0', '', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-25 18:11:52', '2025-01-25 18:11:52'),
(15, 2, 2, 5, 2, NULL, '2025-01-25 18:42:36', 140.0000000, 0.00, 0.00, 0.00, 0.00, '', '04', 'novo', NULL, '0', NULL, '', '', 0, '0', '01', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-25 18:42:36', '2025-01-25 18:42:36'),
(16, 2, 2, 5, 2, NULL, '2025-01-25 18:48:13', 8.0000000, 0.00, 0.00, 0.00, 0.00, '', '03', 'novo', NULL, '0', NULL, '', '', 0, '0', '01', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-25 18:48:13', '2025-01-25 18:48:13'),
(17, 2, 2, 5, 2, NULL, '2025-01-25 18:49:19', 4.0000000, 0.00, 0.00, 0.00, 0.00, '', '04', 'novo', NULL, '0', NULL, '', '', 0, '0', '01', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-25 18:49:19', '2025-01-25 18:49:19'),
(18, 2, NULL, 5, 2, NULL, '2025-01-25 18:50:03', 4.0000000, 0.00, 0.00, 0.00, 0.00, '', '17', 'novo', NULL, '0', NULL, '', '', 0, '0', '', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-25 18:50:03', '2025-01-25 18:50:03'),
(19, 2, NULL, 5, 2, NULL, '2025-01-25 19:00:45', 4.0000000, 0.00, 0.00, 0.00, 0.00, '', '04', 'novo', NULL, '0', NULL, '', '', 0, '0', '01', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-25 19:00:45', '2025-01-25 19:00:45'),
(20, 1, NULL, 2, 1, NULL, '2025-01-29 18:30:37', 2200.0000000, 2200.00, 0.00, 200.00, 0.00, '', '01', 'novo', NULL, '0', NULL, '', '', 0, '0', '', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-29 18:30:37', '2025-01-29 18:30:37'),
(21, 1, 3, 2, 1, NULL, '2025-01-29 18:52:31', 212.7000000, 0.00, 0.00, 0.00, 0.00, '', '03', 'novo', NULL, '0', NULL, '', '', 0, '0', '01', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-29 18:52:31', '2025-01-29 18:52:31'),
(22, 1, 3, 2, 1, NULL, '2025-01-29 18:58:32', 22.0000000, 17.20, 0.00, 0.00, 0.00, '', '01', 'novo', NULL, '0', NULL, '', '', 0, '0', '', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-29 18:58:32', '2025-01-29 18:58:32'),
(23, 1, NULL, 2, 1, NULL, '2025-01-29 18:59:31', 22.0000000, 17.20, 0.00, 0.00, 0.00, '', '01', 'novo', NULL, '0', NULL, '', '', 0, '0', '', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-29 18:59:31', '2025-01-29 18:59:31'),
(24, 1, NULL, 2, 1, NULL, '2025-01-29 19:00:33', 22.0000000, 22.00, 0.00, 0.00, 0.00, '', '01', 'novo', NULL, '0', NULL, '', '', 0, '0', '', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-29 19:00:33', '2025-01-29 19:00:33'),
(25, 1, NULL, 2, 1, NULL, '2025-01-29 19:01:36', 22.0000000, 17.20, 0.00, 0.00, 0.00, '', '01', 'novo', NULL, '0', NULL, '', '', 0, '0', '', '', '', NULL, 0, 0, 0, 0, 0, 0, '2025-01-29 19:01:36', '2025-01-29 19:01:36');

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda_caixa_pre_vendas`
--

CREATE TABLE `venda_caixa_pre_vendas` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `funcionario_id` int(10) UNSIGNED NOT NULL,
  `natureza_id` int(10) UNSIGNED NOT NULL,
  `valor_total` decimal(16,7) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `acrescimo` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) NOT NULL,
  `tipo_pagamento` varchar(2) NOT NULL,
  `observacao` varchar(150) NOT NULL,
  `pedido_delivery_id` int(11) NOT NULL,
  `bandeira_cartao` varchar(2) NOT NULL DEFAULT '99',
  `cnpj_cartao` varchar(18) NOT NULL DEFAULT '',
  `cAut_cartao` varchar(20) NOT NULL DEFAULT '',
  `descricao_pag_outros` varchar(80) NOT NULL DEFAULT '',
  `rascunho` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `venda_caixa_pre_vendas`
--

INSERT INTO `venda_caixa_pre_vendas` (`id`, `empresa_id`, `cliente_id`, `usuario_id`, `funcionario_id`, `natureza_id`, `valor_total`, `desconto`, `acrescimo`, `forma_pagamento`, `tipo_pagamento`, `observacao`, `pedido_delivery_id`, `bandeira_cartao`, `cnpj_cartao`, `cAut_cartao`, `descricao_pag_outros`, `rascunho`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 5, 3, 2, 4.0000000, 0.00, 0.00, '', '', '', 0, '', '', '', '', 0, 1, '2025-01-25 18:10:44', '2025-01-25 18:11:51'),
(2, 2, 2, 5, 3, 2, 140.0000000, 0.00, 0.00, '', '', '', 0, '', '', '', '', 0, 1, '2025-01-25 18:40:09', '2025-01-25 18:42:36'),
(3, 2, 2, 5, 3, 2, 4.0000000, 0.00, 0.00, '', '', '', 0, '', '', '', '', 0, 1, '2025-01-25 18:46:14', '2025-01-25 18:49:19'),
(4, 2, 2, 5, 3, 2, 8.0000000, 0.00, 0.00, '', '', '', 0, '', '', '', '', 0, 1, '2025-01-25 18:47:10', '2025-01-25 18:48:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `video_ajudas`
--

CREATE TABLE `video_ajudas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url_sistema` varchar(255) NOT NULL,
  `url_video` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `xml_enviados`
--

CREATE TABLE `xml_enviados` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED DEFAULT NULL,
  `documento` enum('nfe','nfce','cte','mdfe','devolucao') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `abertura_caixas`
--
ALTER TABLE `abertura_caixas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `abertura_caixas_empresa_id_foreign` (`empresa_id`),
  ADD KEY `abertura_caixas_usuario_id_foreign` (`usuario_id`),
  ADD KEY `abertura_caixas_filial_id_foreign` (`filial_id`);

--
-- Índices de tabela `acessors`
--
ALTER TABLE `acessors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `acessors_empresa_id_foreign` (`empresa_id`),
  ADD KEY `acessors_cidade_id_foreign` (`cidade_id`);

--
-- Índices de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agendamentos_funcionario_id_foreign` (`funcionario_id`),
  ADD KEY `agendamentos_cliente_id_foreign` (`cliente_id`),
  ADD KEY `agendamentos_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `alertas`
--
ALTER TABLE `alertas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `alteracao_estoques`
--
ALTER TABLE `alteracao_estoques`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alteracao_estoques_empresa_id_foreign` (`empresa_id`),
  ADD KEY `alteracao_estoques_produto_id_foreign` (`produto_id`),
  ADD KEY `alteracao_estoques_usuario_id_foreign` (`usuario_id`);

--
-- Índices de tabela `apk_comandas`
--
ALTER TABLE `apk_comandas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apk_comandas_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `apontamentos`
--
ALTER TABLE `apontamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apontamentos_empresa_id_foreign` (`empresa_id`),
  ADD KEY `apontamentos_produto_id_foreign` (`produto_id`),
  ADD KEY `apontamentos_usuario_id_foreign` (`usuario_id`);

--
-- Índices de tabela `apuracao_mensals`
--
ALTER TABLE `apuracao_mensals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apuracao_mensals_funcionario_id_foreign` (`funcionario_id`);

--
-- Índices de tabela `apuracao_salario_eventos`
--
ALTER TABLE `apuracao_salario_eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apuracao_salario_eventos_apuracao_id_foreign` (`apuracao_id`),
  ADD KEY `apuracao_salario_eventos_evento_id_foreign` (`evento_id`);

--
-- Índices de tabela `atividade_eventos`
--
ALTER TABLE `atividade_eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `atividade_eventos_evento_id_foreign` (`evento_id`),
  ADD KEY `atividade_eventos_funcionario_id_foreign` (`funcionario_id`);

--
-- Índices de tabela `atividade_servicos`
--
ALTER TABLE `atividade_servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `atividade_servicos_servico_id_foreign` (`servico_id`),
  ADD KEY `atividade_servicos_atividade_id_foreign` (`atividade_id`);

--
-- Índices de tabela `autor_post_blog_ecommerces`
--
ALTER TABLE `autor_post_blog_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autor_post_blog_ecommerces_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `bairro_deliveries`
--
ALTER TABLE `bairro_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bairro_deliveries_cidade_id_foreign` (`cidade_id`);

--
-- Índices de tabela `bairro_delivery_lojas`
--
ALTER TABLE `bairro_delivery_lojas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bairro_delivery_lojas_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `banner_mais_vendidos`
--
ALTER TABLE `banner_mais_vendidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banner_mais_vendidos_empresa_id_foreign` (`empresa_id`),
  ADD KEY `banner_mais_vendidos_produto_delivery_id_foreign` (`produto_delivery_id`),
  ADD KEY `banner_mais_vendidos_pack_id_foreign` (`pack_id`);

--
-- Índices de tabela `banner_topos`
--
ALTER TABLE `banner_topos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banner_topos_empresa_id_foreign` (`empresa_id`),
  ADD KEY `banner_topos_produto_delivery_id_foreign` (`produto_delivery_id`),
  ADD KEY `banner_topos_pack_id_foreign` (`pack_id`);

--
-- Índices de tabela `boletos`
--
ALTER TABLE `boletos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boletos_banco_id_foreign` (`banco_id`),
  ADD KEY `boletos_conta_id_foreign` (`conta_id`);

--
-- Índices de tabela `carrossel_deliveries`
--
ALTER TABLE `carrossel_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carrossel_deliveries_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `carrossel_ecommerces`
--
ALTER TABLE `carrossel_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carrossel_ecommerces_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorias_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `categoria_contas`
--
ALTER TABLE `categoria_contas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_contas_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `categoria_despesa_ctes`
--
ALTER TABLE `categoria_despesa_ctes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_despesa_ctes_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `categoria_destaque_master_deliveries`
--
ALTER TABLE `categoria_destaque_master_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categoria_empresas`
--
ALTER TABLE `categoria_empresas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_empresas_empresa_id_foreign` (`empresa_id`),
  ADD KEY `categoria_empresas_categoria_id_foreign` (`categoria_id`);

--
-- Índices de tabela `categoria_loja_segmentos`
--
ALTER TABLE `categoria_loja_segmentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_loja_segmentos_categoria_id_foreign` (`categoria_id`),
  ADD KEY `categoria_loja_segmentos_loja_id_foreign` (`loja_id`);

--
-- Índices de tabela `categoria_master_deliveries`
--
ALTER TABLE `categoria_master_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categoria_post_blog_ecommerces`
--
ALTER TABLE `categoria_post_blog_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_post_blog_ecommerces_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `categoria_produto_deliveries`
--
ALTER TABLE `categoria_produto_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_produto_deliveries_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `categoria_produto_ecommerces`
--
ALTER TABLE `categoria_produto_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_produto_ecommerces_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `categoria_servicos`
--
ALTER TABLE `categoria_servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_servicos_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `certificados`
--
ALTER TABLE `certificados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certificados_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `chave_nfe_ctes`
--
ALTER TABLE `chave_nfe_ctes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chave_nfe_ctes_cte_id_foreign` (`cte_id`);

--
-- Índices de tabela `cidades`
--
ALTER TABLE `cidades`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cidade_deliveries`
--
ALTER TABLE `cidade_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ciots`
--
ALTER TABLE `ciots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ciots_mdfe_id_foreign` (`mdfe_id`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_empresa_id_foreign` (`empresa_id`),
  ADD KEY `clientes_cidade_id_foreign` (`cidade_id`),
  ADD KEY `clientes_cidade_cobranca_id_foreign` (`cidade_cobranca_id`);

--
-- Índices de tabela `cliente_deliveries`
--
ALTER TABLE `cliente_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_deliveries_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `cliente_ecommerces`
--
ALTER TABLE `cliente_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_ecommerces_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `codigo_descontos`
--
ALTER TABLE `codigo_descontos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigo_descontos_empresa_id_foreign` (`empresa_id`),
  ADD KEY `codigo_descontos_cliente_id_foreign` (`cliente_id`);

--
-- Índices de tabela `comissao_vendas`
--
ALTER TABLE `comissao_vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comissao_vendas_empresa_id_foreign` (`empresa_id`),
  ADD KEY `comissao_vendas_funcionario_id_foreign` (`funcionario_id`);

--
-- Índices de tabela `complemento_deliveries`
--
ALTER TABLE `complemento_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complemento_deliveries_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `componente_ctes`
--
ALTER TABLE `componente_ctes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `componente_ctes_cte_id_foreign` (`cte_id`);

--
-- Índices de tabela `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compras_empresa_id_foreign` (`empresa_id`),
  ADD KEY `compras_filial_id_foreign` (`filial_id`),
  ADD KEY `compras_fornecedor_id_foreign` (`fornecedor_id`),
  ADD KEY `compras_usuario_id_foreign` (`usuario_id`),
  ADD KEY `compras_transportadora_id_foreign` (`transportadora_id`);

--
-- Índices de tabela `compra_referencias`
--
ALTER TABLE `compra_referencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compra_referencias_compra_id_foreign` (`compra_id`);

--
-- Índices de tabela `config_caixas`
--
ALTER TABLE `config_caixas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `config_caixas_usuario_id_foreign` (`usuario_id`);

--
-- Índices de tabela `config_ecommerces`
--
ALTER TABLE `config_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `config_ecommerces_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `config_notas`
--
ALTER TABLE `config_notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `config_notas_empresa_id_foreign` (`empresa_id`),
  ADD KEY `config_notas_cidade_id_foreign` (`cidade_id`);

--
-- Índices de tabela `contadors`
--
ALTER TABLE `contadors`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `contato_ecommerces`
--
ALTER TABLE `contato_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contato_ecommerces_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `contato_funcionarios`
--
ALTER TABLE `contato_funcionarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contato_funcionarios_funcionario_id_foreign` (`funcionario_id`);

--
-- Índices de tabela `conta_bancarias`
--
ALTER TABLE `conta_bancarias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conta_bancarias_empresa_id_foreign` (`empresa_id`),
  ADD KEY `conta_bancarias_cidade_id_foreign` (`cidade_id`);

--
-- Índices de tabela `conta_pagars`
--
ALTER TABLE `conta_pagars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conta_pagars_empresa_id_foreign` (`empresa_id`),
  ADD KEY `conta_pagars_compra_id_foreign` (`compra_id`),
  ADD KEY `conta_pagars_categoria_id_foreign` (`categoria_id`),
  ADD KEY `conta_pagars_filial_id_foreign` (`filial_id`);

--
-- Índices de tabela `conta_recebers`
--
ALTER TABLE `conta_recebers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conta_recebers_empresa_id_foreign` (`empresa_id`),
  ADD KEY `conta_recebers_venda_id_foreign` (`venda_id`),
  ADD KEY `conta_recebers_cliente_id_foreign` (`cliente_id`),
  ADD KEY `conta_recebers_categoria_id_foreign` (`categoria_id`),
  ADD KEY `conta_recebers_venda_caixa_id_foreign` (`venda_caixa_id`),
  ADD KEY `conta_recebers_filial_id_foreign` (`filial_id`);

--
-- Índices de tabela `contigencias`
--
ALTER TABLE `contigencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contigencias_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cotacaos`
--
ALTER TABLE `cotacaos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cotacaos_empresa_id_foreign` (`empresa_id`),
  ADD KEY `cotacaos_fornecedor_id_foreign` (`fornecedor_id`);

--
-- Índices de tabela `credito_vendas`
--
ALTER TABLE `credito_vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credito_vendas_empresa_id_foreign` (`empresa_id`),
  ADD KEY `credito_vendas_venda_id_foreign` (`venda_id`),
  ADD KEY `credito_vendas_cliente_id_foreign` (`cliente_id`);

--
-- Índices de tabela `ctes`
--
ALTER TABLE `ctes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ctes_empresa_id_foreign` (`empresa_id`),
  ADD KEY `ctes_remetente_id_foreign` (`remetente_id`),
  ADD KEY `ctes_destinatario_id_foreign` (`destinatario_id`),
  ADD KEY `ctes_expedidor_id_foreign` (`expedidor_id`),
  ADD KEY `ctes_recebedor_id_foreign` (`recebedor_id`),
  ADD KEY `ctes_usuario_id_foreign` (`usuario_id`),
  ADD KEY `ctes_filial_id_foreign` (`filial_id`),
  ADD KEY `ctes_natureza_id_foreign` (`natureza_id`),
  ADD KEY `ctes_municipio_envio_foreign` (`municipio_envio`),
  ADD KEY `ctes_municipio_inicio_foreign` (`municipio_inicio`),
  ADD KEY `ctes_municipio_fim_foreign` (`municipio_fim`),
  ADD KEY `ctes_municipio_tomador_foreign` (`municipio_tomador`),
  ADD KEY `ctes_veiculo_id_foreign` (`veiculo_id`);

--
-- Índices de tabela `cte_os`
--
ALTER TABLE `cte_os`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cte_os_empresa_id_foreign` (`empresa_id`),
  ADD KEY `cte_os_emitente_id_foreign` (`emitente_id`),
  ADD KEY `cte_os_tomador_id_foreign` (`tomador_id`),
  ADD KEY `cte_os_municipio_envio_foreign` (`municipio_envio`),
  ADD KEY `cte_os_municipio_inicio_foreign` (`municipio_inicio`),
  ADD KEY `cte_os_municipio_fim_foreign` (`municipio_fim`),
  ADD KEY `cte_os_veiculo_id_foreign` (`veiculo_id`),
  ADD KEY `cte_os_usuario_id_foreign` (`usuario_id`),
  ADD KEY `cte_os_natureza_id_foreign` (`natureza_id`);

--
-- Índices de tabela `cupom_desconto_ecommerces`
--
ALTER TABLE `cupom_desconto_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cupom_desconto_ecommerces_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `curtida_produto_ecommerces`
--
ALTER TABLE `curtida_produto_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `curtida_produto_ecommerces_produto_id_foreign` (`produto_id`),
  ADD KEY `curtida_produto_ecommerces_cliente_id_foreign` (`cliente_id`);

--
-- Índices de tabela `c_te_descargas`
--
ALTER TABLE `c_te_descargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_te_descargas_info_id_foreign` (`info_id`);

--
-- Índices de tabela `delivery_configs`
--
ALTER TABLE `delivery_configs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_configs_empresa_id_foreign` (`empresa_id`),
  ADD KEY `delivery_configs_cidade_id_foreign` (`cidade_id`);

--
-- Índices de tabela `delivery_config_galerias`
--
ALTER TABLE `delivery_config_galerias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_config_galerias_config_id_foreign` (`config_id`);

--
-- Índices de tabela `despesa_ctes`
--
ALTER TABLE `despesa_ctes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `despesa_ctes_categoria_id_foreign` (`categoria_id`),
  ADD KEY `despesa_ctes_cte_id_foreign` (`cte_id`);

--
-- Índices de tabela `destaque_deliveries`
--
ALTER TABLE `destaque_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destaque_deliveries_empresa_id_foreign` (`empresa_id`),
  ADD KEY `destaque_deliveries_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `destaque_delivery_masters`
--
ALTER TABLE `destaque_delivery_masters`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `devolucaos`
--
ALTER TABLE `devolucaos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devolucaos_empresa_id_foreign` (`empresa_id`),
  ADD KEY `devolucaos_fornecedor_id_foreign` (`fornecedor_id`),
  ADD KEY `devolucaos_usuario_id_foreign` (`usuario_id`),
  ADD KEY `devolucaos_natureza_id_foreign` (`natureza_id`),
  ADD KEY `devolucaos_transportadora_id_foreign` (`transportadora_id`),
  ADD KEY `devolucaos_filial_id_foreign` (`filial_id`);

--
-- Índices de tabela `divisao_grades`
--
ALTER TABLE `divisao_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `divisao_grades_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `dres`
--
ALTER TABLE `dres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dres_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `dre_categorias`
--
ALTER TABLE `dre_categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dre_categorias_dre_id_foreign` (`dre_id`);

--
-- Índices de tabela `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empresas_cidade_id_foreign` (`cidade_id`);

--
-- Índices de tabela `empresa_contratos`
--
ALTER TABLE `empresa_contratos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empresa_contratos_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `endereco_deliveries`
--
ALTER TABLE `endereco_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `endereco_deliveries_cliente_id_foreign` (`cliente_id`),
  ADD KEY `endereco_deliveries_cidade_id_foreign` (`cidade_id`);

--
-- Índices de tabela `endereco_ecommerces`
--
ALTER TABLE `endereco_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `endereco_ecommerces_cliente_id_foreign` (`cliente_id`);

--
-- Índices de tabela `erro_logs`
--
ALTER TABLE `erro_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `erro_logs_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `escritorio_contabils`
--
ALTER TABLE `escritorio_contabils`
  ADD PRIMARY KEY (`id`),
  ADD KEY `escritorio_contabils_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `estoques`
--
ALTER TABLE `estoques`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estoques_empresa_id_foreign` (`empresa_id`),
  ADD KEY `estoques_produto_id_foreign` (`produto_id`),
  ADD KEY `estoques_filial_id_foreign` (`filial_id`);

--
-- Índices de tabela `etiquetas`
--
ALTER TABLE `etiquetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `etiquetas_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eventos_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `evento_funcionarios`
--
ALTER TABLE `evento_funcionarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evento_funcionarios_evento_id_foreign` (`evento_id`),
  ADD KEY `evento_funcionarios_funcionario_id_foreign` (`funcionario_id`);

--
-- Índices de tabela `evento_salarios`
--
ALTER TABLE `evento_salarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evento_salarios_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices de tabela `fatura_frente_caixas`
--
ALTER TABLE `fatura_frente_caixas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fatura_frente_caixas_venda_caixa_id_foreign` (`venda_caixa_id`);

--
-- Índices de tabela `fatura_orcamentos`
--
ALTER TABLE `fatura_orcamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fatura_orcamentos_empresa_id_foreign` (`empresa_id`),
  ADD KEY `fatura_orcamentos_orcamento_id_foreign` (`orcamento_id`);

--
-- Índices de tabela `fatura_pre_vendas`
--
ALTER TABLE `fatura_pre_vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fatura_pre_vendas_pre_venda_id_foreign` (`pre_venda_id`);

--
-- Índices de tabela `filials`
--
ALTER TABLE `filials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filials_empresa_id_foreign` (`empresa_id`),
  ADD KEY `filials_cidade_id_foreign` (`cidade_id`);

--
-- Índices de tabela `financeiro_representantes`
--
ALTER TABLE `financeiro_representantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `financeiro_representantes_representante_empresa_id_foreign` (`representante_empresa_id`);

--
-- Índices de tabela `forma_pagamentos`
--
ALTER TABLE `forma_pagamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forma_pagamentos_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `fornecedors`
--
ALTER TABLE `fornecedors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fornecedors_empresa_id_foreign` (`empresa_id`),
  ADD KEY `fornecedors_cidade_id_foreign` (`cidade_id`);

--
-- Índices de tabela `fretes`
--
ALTER TABLE `fretes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `funcionamento_deliveries`
--
ALTER TABLE `funcionamento_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `funcionamento_deliveries_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `funcionarios_empresa_id_foreign` (`empresa_id`),
  ADD KEY `funcionarios_usuario_id_foreign` (`usuario_id`),
  ADD KEY `funcionarios_cidade_id_foreign` (`cidade_id`);

--
-- Índices de tabela `funcionario_eventos`
--
ALTER TABLE `funcionario_eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `funcionario_eventos_funcionario_id_foreign` (`funcionario_id`),
  ADD KEY `funcionario_eventos_evento_id_foreign` (`evento_id`);

--
-- Índices de tabela `funcionario_os`
--
ALTER TABLE `funcionario_os`
  ADD PRIMARY KEY (`id`),
  ADD KEY `funcionario_os_usuario_id_foreign` (`usuario_id`),
  ADD KEY `funcionario_os_ordem_servico_id_foreign` (`ordem_servico_id`),
  ADD KEY `funcionario_os_funcionario_id_foreign` (`funcionario_id`);

--
-- Índices de tabela `grupo_clientes`
--
ALTER TABLE `grupo_clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_clientes_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `imagem_produto_ecommerces`
--
ALTER TABLE `imagem_produto_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imagem_produto_ecommerces_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `imagens_produto_deliveries`
--
ALTER TABLE `imagens_produto_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imagens_produto_deliveries_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `informativo_ecommerces`
--
ALTER TABLE `informativo_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `informativo_ecommerces_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `info_descargas`
--
ALTER TABLE `info_descargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `info_descargas_mdfe_id_foreign` (`mdfe_id`),
  ADD KEY `info_descargas_cidade_id_foreign` (`cidade_id`);

--
-- Índices de tabela `inutiliza_nves`
--
ALTER TABLE `inutiliza_nves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inutiliza_nves_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `inventarios`
--
ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventarios_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `item_agendamentos`
--
ALTER TABLE `item_agendamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_agendamentos_servico_id_foreign` (`servico_id`),
  ADD KEY `item_agendamentos_agendamento_id_foreign` (`agendamento_id`);

--
-- Índices de tabela `item_compras`
--
ALTER TABLE `item_compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_compras_compra_id_foreign` (`compra_id`),
  ADD KEY `item_compras_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `item_cotacaos`
--
ALTER TABLE `item_cotacaos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_cotacaos_cotacao_id_foreign` (`cotacao_id`),
  ADD KEY `item_cotacaos_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `item_devolucaos`
--
ALTER TABLE `item_devolucaos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_devolucaos_devolucao_id_foreign` (`devolucao_id`);

--
-- Índices de tabela `item_dves`
--
ALTER TABLE `item_dves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_dves_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `item_inventarios`
--
ALTER TABLE `item_inventarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_inventarios_inventario_id_foreign` (`inventario_id`),
  ADD KEY `item_inventarios_produto_id_foreign` (`produto_id`),
  ADD KEY `item_inventarios_usuario_id_foreign` (`usuario_id`);

--
-- Índices de tabela `item_i_b_t_es`
--
ALTER TABLE `item_i_b_t_es`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_i_b_t_es_ibte_id_foreign` (`ibte_id`);

--
-- Índices de tabela `item_locacaos`
--
ALTER TABLE `item_locacaos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_locacaos_locacao_id_foreign` (`locacao_id`),
  ADD KEY `item_locacaos_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `item_locacao_disponibilidades`
--
ALTER TABLE `item_locacao_disponibilidades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_locacao_disponibilidades_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `item_orcamentos`
--
ALTER TABLE `item_orcamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_orcamentos_orcamento_id_foreign` (`orcamento_id`),
  ADD KEY `item_orcamentos_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `item_pack_produto_deliveries`
--
ALTER TABLE `item_pack_produto_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_pack_produto_deliveries_produto_delivery_id_foreign` (`produto_delivery_id`),
  ADD KEY `item_pack_produto_deliveries_pack_id_foreign` (`pack_id`);

--
-- Índices de tabela `item_pedidos`
--
ALTER TABLE `item_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_pedidos_produto_id_foreign` (`produto_id`),
  ADD KEY `item_pedidos_pedido_id_foreign` (`pedido_id`),
  ADD KEY `item_pedidos_tamanho_pizza_id_foreign` (`tamanho_pizza_id`);

--
-- Índices de tabela `item_pedido_complemento_deliveries`
--
ALTER TABLE `item_pedido_complemento_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_pedido_complemento_deliveries_item_pedido_id_foreign` (`item_pedido_id`),
  ADD KEY `item_pedido_complemento_deliveries_complemento_id_foreign` (`complemento_id`);

--
-- Índices de tabela `item_pedido_complemento_locals`
--
ALTER TABLE `item_pedido_complemento_locals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_pedido_complemento_locals_item_pedido_foreign` (`item_pedido`),
  ADD KEY `item_pedido_complemento_locals_complemento_id_foreign` (`complemento_id`);

--
-- Índices de tabela `item_pedido_deliveries`
--
ALTER TABLE `item_pedido_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_pedido_deliveries_produto_id_foreign` (`produto_id`),
  ADD KEY `item_pedido_deliveries_pedido_id_foreign` (`pedido_id`),
  ADD KEY `item_pedido_deliveries_tamanho_id_foreign` (`tamanho_id`);

--
-- Índices de tabela `item_pedido_ecommerces`
--
ALTER TABLE `item_pedido_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_pedido_ecommerces_pedido_id_foreign` (`pedido_id`),
  ADD KEY `item_pedido_ecommerces_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `item_pizza_pedidos`
--
ALTER TABLE `item_pizza_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_pizza_pedidos_item_pedido_foreign` (`item_pedido`),
  ADD KEY `item_pizza_pedidos_sabor_id_foreign` (`sabor_id`);

--
-- Índices de tabela `item_pizza_pedido_locals`
--
ALTER TABLE `item_pizza_pedido_locals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_pizza_pedido_locals_item_pedido_foreign` (`item_pedido`),
  ADD KEY `item_pizza_pedido_locals_sabor_id_foreign` (`sabor_id`);

--
-- Índices de tabela `item_receitas`
--
ALTER TABLE `item_receitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_receitas_produto_id_foreign` (`produto_id`),
  ADD KEY `item_receitas_receita_id_foreign` (`receita_id`);

--
-- Índices de tabela `item_remessa_nves`
--
ALTER TABLE `item_remessa_nves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_remessa_nves_remessa_id_foreign` (`remessa_id`),
  ADD KEY `item_remessa_nves_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `item_vendas`
--
ALTER TABLE `item_vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_vendas_venda_id_foreign` (`venda_id`),
  ADD KEY `item_vendas_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `item_venda_caixas`
--
ALTER TABLE `item_venda_caixas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_venda_caixas_venda_caixa_id_foreign` (`venda_caixa_id`),
  ADD KEY `item_venda_caixas_produto_id_foreign` (`produto_id`),
  ADD KEY `item_venda_caixas_item_pedido_id_foreign` (`item_pedido_id`);

--
-- Índices de tabela `item_venda_caixa_pre_vendas`
--
ALTER TABLE `item_venda_caixa_pre_vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_venda_caixa_pre_vendas_pre_venda_id_foreign` (`pre_venda_id`),
  ADD KEY `item_venda_caixa_pre_vendas_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `i_b_p_ts`
--
ALTER TABLE `i_b_p_ts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `lacre_transportes`
--
ALTER TABLE `lacre_transportes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lacre_transportes_info_id_foreign` (`info_id`);

--
-- Índices de tabela `lacre_unidade_cargas`
--
ALTER TABLE `lacre_unidade_cargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lacre_unidade_cargas_info_id_foreign` (`info_id`);

--
-- Índices de tabela `lancamento_categorias`
--
ALTER TABLE `lancamento_categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lancamento_categorias_categoria_id_foreign` (`categoria_id`);

--
-- Índices de tabela `lista_complemento_deliveries`
--
ALTER TABLE `lista_complemento_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lista_complemento_deliveries_categoria_id_foreign` (`categoria_id`),
  ADD KEY `lista_complemento_deliveries_complemento_id_foreign` (`complemento_id`);

--
-- Índices de tabela `lista_precos`
--
ALTER TABLE `lista_precos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lista_precos_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `locacaos`
--
ALTER TABLE `locacaos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locacaos_empresa_id_foreign` (`empresa_id`),
  ADD KEY `locacaos_cliente_id_foreign` (`cliente_id`);

--
-- Índices de tabela `manifesta_ctes`
--
ALTER TABLE `manifesta_ctes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manifesta_ctes_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `manifesta_dves`
--
ALTER TABLE `manifesta_dves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manifesta_dves_empresa_id_foreign` (`empresa_id`),
  ADD KEY `manifesta_dves_filial_id_foreign` (`filial_id`);

--
-- Índices de tabela `manifesto_dias`
--
ALTER TABLE `manifesto_dias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manifesto_dias_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marcas_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `mdves`
--
ALTER TABLE `mdves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdves_empresa_id_foreign` (`empresa_id`),
  ADD KEY `mdves_filial_id_foreign` (`filial_id`),
  ADD KEY `mdves_veiculo_tracao_id_foreign` (`veiculo_tracao_id`),
  ADD KEY `mdves_veiculo_reboque_id_foreign` (`veiculo_reboque_id`),
  ADD KEY `mdves_veiculo_reboque2_id_foreign` (`veiculo_reboque2_id`),
  ADD KEY `mdves_veiculo_reboque3_id_foreign` (`veiculo_reboque3_id`);

--
-- Índices de tabela `medida_ctes`
--
ALTER TABLE `medida_ctes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medida_ctes_cte_id_foreign` (`cte_id`);

--
-- Índices de tabela `mercado_configs`
--
ALTER TABLE `mercado_configs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mercado_configs_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mesas_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `motoboys`
--
ALTER TABLE `motoboys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `motoboys_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `movimentacao_finaneiras`
--
ALTER TABLE `movimentacao_finaneiras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movimentacao_finaneiras_empresa_id_foreign` (`empresa_id`),
  ADD KEY `movimentacao_finaneiras_usuario_id_foreign` (`usuario_id`);

--
-- Índices de tabela `municipio_carregamentos`
--
ALTER TABLE `municipio_carregamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `municipio_carregamentos_mdfe_id_foreign` (`mdfe_id`),
  ADD KEY `municipio_carregamentos_cidade_id_foreign` (`cidade_id`);

--
-- Índices de tabela `natureza_operacaos`
--
ALTER TABLE `natureza_operacaos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `natureza_operacaos_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `nfses`
--
ALTER TABLE `nfses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nfses_empresa_id_foreign` (`empresa_id`),
  ADD KEY `nfses_cliente_id_foreign` (`cliente_id`),
  ADD KEY `nfses_cidade_id_foreign` (`cidade_id`),
  ADD KEY `nfses_filial_id_foreign` (`filial_id`);

--
-- Índices de tabela `nfse_servicos`
--
ALTER TABLE `nfse_servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nfse_servicos_nfse_id_foreign` (`nfse_id`),
  ADD KEY `nfse_servicos_servico_id_foreign` (`servico_id`);

--
-- Índices de tabela `nuvem_shop_configs`
--
ALTER TABLE `nuvem_shop_configs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nuvem_shop_configs_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `nuvem_shop_item_pedidos`
--
ALTER TABLE `nuvem_shop_item_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nuvem_shop_item_pedidos_pedido_id_foreign` (`pedido_id`),
  ADD KEY `nuvem_shop_item_pedidos_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `nuvem_shop_pedidos`
--
ALTER TABLE `nuvem_shop_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nuvem_shop_pedidos_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `n_fe_descargas`
--
ALTER TABLE `n_fe_descargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `n_fe_descargas_info_id_foreign` (`info_id`);

--
-- Índices de tabela `n_fe_referecias`
--
ALTER TABLE `n_fe_referecias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `n_fe_referecias_venda_id_foreign` (`venda_id`);

--
-- Índices de tabela `orcamentos`
--
ALTER TABLE `orcamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orcamentos_empresa_id_foreign` (`empresa_id`),
  ADD KEY `orcamentos_cliente_id_foreign` (`cliente_id`),
  ADD KEY `orcamentos_usuario_id_foreign` (`usuario_id`),
  ADD KEY `orcamentos_natureza_id_foreign` (`natureza_id`),
  ADD KEY `orcamentos_frete_id_foreign` (`frete_id`),
  ADD KEY `orcamentos_transportadora_id_foreign` (`transportadora_id`),
  ADD KEY `orcamentos_filial_id_foreign` (`filial_id`);

--
-- Índices de tabela `ordem_servicos`
--
ALTER TABLE `ordem_servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordem_servicos_empresa_id_foreign` (`empresa_id`),
  ADD KEY `ordem_servicos_cliente_id_foreign` (`cliente_id`),
  ADD KEY `ordem_servicos_usuario_id_foreign` (`usuario_id`);

--
-- Índices de tabela `pack_produto_deliveries`
--
ALTER TABLE `pack_produto_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices de tabela `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_empresa_id_foreign` (`empresa_id`),
  ADD KEY `payments_plano_id_foreign` (`plano_id`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidos_empresa_id_foreign` (`empresa_id`),
  ADD KEY `pedidos_mesa_id_foreign` (`mesa_id`),
  ADD KEY `pedidos_cliente_id_foreign` (`cliente_id`),
  ADD KEY `pedidos_bairro_id_foreign` (`bairro_id`);

--
-- Índices de tabela `pedido_deletes`
--
ALTER TABLE `pedido_deletes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_deletes_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `pedido_deliveries`
--
ALTER TABLE `pedido_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_deliveries_empresa_id_foreign` (`empresa_id`),
  ADD KEY `pedido_deliveries_cliente_id_foreign` (`cliente_id`),
  ADD KEY `pedido_deliveries_endereco_id_foreign` (`endereco_id`),
  ADD KEY `pedido_deliveries_cupom_id_foreign` (`cupom_id`);

--
-- Índices de tabela `pedido_ecommerces`
--
ALTER TABLE `pedido_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_ecommerces_empresa_id_foreign` (`empresa_id`),
  ADD KEY `pedido_ecommerces_cliente_id_foreign` (`cliente_id`),
  ADD KEY `pedido_ecommerces_endereco_id_foreign` (`endereco_id`);

--
-- Índices de tabela `pedido_motoboys`
--
ALTER TABLE `pedido_motoboys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_motoboys_motoboy_id_foreign` (`motoboy_id`),
  ADD KEY `pedido_motoboys_pedido_id_foreign` (`pedido_id`);

--
-- Índices de tabela `pedido_pag_seguros`
--
ALTER TABLE `pedido_pag_seguros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_pag_seguros_pedido_delivery_id_foreign` (`pedido_delivery_id`);

--
-- Índices de tabela `pedido_qr_code_clientes`
--
ALTER TABLE `pedido_qr_code_clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_qr_code_clientes_empresa_id_foreign` (`empresa_id`),
  ADD KEY `pedido_qr_code_clientes_pedido_id_foreign` (`pedido_id`);

--
-- Índices de tabela `percursos`
--
ALTER TABLE `percursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `percursos_mdfe_id_foreign` (`mdfe_id`);

--
-- Índices de tabela `perfil_acessos`
--
ALTER TABLE `perfil_acessos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices de tabela `pesquisas`
--
ALTER TABLE `pesquisas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `planos`
--
ALTER TABLE `planos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `plano_empresas`
--
ALTER TABLE `plano_empresas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plano_empresas_empresa_id_foreign` (`empresa_id`),
  ADD KEY `plano_empresas_plano_id_foreign` (`plano_id`);

--
-- Índices de tabela `plano_empresa_representantes`
--
ALTER TABLE `plano_empresa_representantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plano_empresa_representantes_empresa_id_foreign` (`empresa_id`),
  ADD KEY `plano_empresa_representantes_plano_id_foreign` (`plano_id`),
  ADD KEY `plano_empresa_representantes_representante_id_foreign` (`representante_id`);

--
-- Índices de tabela `post_blog_ecommerces`
--
ALTER TABLE `post_blog_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_blog_ecommerces_categoria_id_foreign` (`categoria_id`),
  ADD KEY `post_blog_ecommerces_autor_id_foreign` (`autor_id`),
  ADD KEY `post_blog_ecommerces_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produtos_empresa_id_foreign` (`empresa_id`),
  ADD KEY `produtos_categoria_id_foreign` (`categoria_id`),
  ADD KEY `produtos_sub_categoria_id_foreign` (`sub_categoria_id`),
  ADD KEY `produtos_marca_id_foreign` (`marca_id`);

--
-- Índices de tabela `produto_deliveries`
--
ALTER TABLE `produto_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_deliveries_empresa_id_foreign` (`empresa_id`),
  ADD KEY `produto_deliveries_produto_id_foreign` (`produto_id`),
  ADD KEY `produto_deliveries_categoria_id_foreign` (`categoria_id`);

--
-- Índices de tabela `produto_destaque_master_deliveries`
--
ALTER TABLE `produto_destaque_master_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_destaque_master_deliveries_produto_id_foreign` (`produto_id`),
  ADD KEY `produto_destaque_master_deliveries_categoria_id_foreign` (`categoria_id`);

--
-- Índices de tabela `produto_ecommerces`
--
ALTER TABLE `produto_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_ecommerces_empresa_id_foreign` (`empresa_id`),
  ADD KEY `produto_ecommerces_produto_id_foreign` (`produto_id`),
  ADD KEY `produto_ecommerces_categoria_id_foreign` (`categoria_id`);

--
-- Índices de tabela `produto_favorito_deliveries`
--
ALTER TABLE `produto_favorito_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_favorito_deliveries_produto_id_foreign` (`produto_id`),
  ADD KEY `produto_favorito_deliveries_cliente_id_foreign` (`cliente_id`);

--
-- Índices de tabela `produto_ibpts`
--
ALTER TABLE `produto_ibpts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_ibpts_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `produto_lista_precos`
--
ALTER TABLE `produto_lista_precos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_lista_precos_lista_id_foreign` (`lista_id`),
  ADD KEY `produto_lista_precos_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `produto_os`
--
ALTER TABLE `produto_os`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_os_produto_id_foreign` (`produto_id`),
  ADD KEY `produto_os_ordem_servico_id_foreign` (`ordem_servico_id`);

--
-- Índices de tabela `produto_pizzas`
--
ALTER TABLE `produto_pizzas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_pizzas_produto_id_foreign` (`produto_id`),
  ADD KEY `produto_pizzas_tamanho_id_foreign` (`tamanho_id`);

--
-- Índices de tabela `pushes`
--
ALTER TABLE `pushes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pushes_empresa_id_foreign` (`empresa_id`),
  ADD KEY `pushes_cliente_id_foreign` (`cliente_id`);

--
-- Índices de tabela `receitas`
--
ALTER TABLE `receitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receitas_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `receita_ctes`
--
ALTER TABLE `receita_ctes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receita_ctes_cte_id_foreign` (`cte_id`);

--
-- Índices de tabela `record_logs`
--
ALTER TABLE `record_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record_logs_usuario_log_id_foreign` (`usuario_log_id`),
  ADD KEY `record_logs_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `relatorio_os`
--
ALTER TABLE `relatorio_os`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relatorio_os_usuario_id_foreign` (`usuario_id`),
  ADD KEY `relatorio_os_ordem_servico_id_foreign` (`ordem_servico_id`);

--
-- Índices de tabela `remessas`
--
ALTER TABLE `remessas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `remessas_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `remessa_boletos`
--
ALTER TABLE `remessa_boletos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `remessa_boletos_remessa_id_foreign` (`remessa_id`),
  ADD KEY `remessa_boletos_boleto_id_foreign` (`boleto_id`);

--
-- Índices de tabela `remessa_nfe_faturas`
--
ALTER TABLE `remessa_nfe_faturas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `remessa_nfe_faturas_remessa_id_foreign` (`remessa_id`);

--
-- Índices de tabela `remessa_nves`
--
ALTER TABLE `remessa_nves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `remessa_nves_empresa_id_foreign` (`empresa_id`),
  ADD KEY `remessa_nves_filial_id_foreign` (`filial_id`),
  ADD KEY `remessa_nves_cliente_id_foreign` (`cliente_id`),
  ADD KEY `remessa_nves_usuario_id_foreign` (`usuario_id`),
  ADD KEY `remessa_nves_natureza_id_foreign` (`natureza_id`),
  ADD KEY `remessa_nves_transportadora_id_foreign` (`transportadora_id`);

--
-- Índices de tabela `remessa_referencia_nves`
--
ALTER TABLE `remessa_referencia_nves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `remessa_referencia_nves_remessa_id_foreign` (`remessa_id`);

--
-- Índices de tabela `representantes`
--
ALTER TABLE `representantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `representantes_cidade_id_foreign` (`cidade_id`),
  ADD KEY `representantes_usuario_id_foreign` (`usuario_id`);

--
-- Índices de tabela `representante_empresas`
--
ALTER TABLE `representante_empresas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `representante_empresas_representante_id_foreign` (`representante_id`),
  ADD KEY `representante_empresas_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `sangria_caixas`
--
ALTER TABLE `sangria_caixas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sangria_caixas_empresa_id_foreign` (`empresa_id`),
  ADD KEY `sangria_caixas_usuario_id_foreign` (`usuario_id`);

--
-- Índices de tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servicos_empresa_id_foreign` (`empresa_id`),
  ADD KEY `servicos_categoria_id_foreign` (`categoria_id`);

--
-- Índices de tabela `servico_os`
--
ALTER TABLE `servico_os`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servico_os_servico_id_foreign` (`servico_id`),
  ADD KEY `servico_os_ordem_servico_id_foreign` (`ordem_servico_id`);

--
-- Índices de tabela `sub_categorias`
--
ALTER TABLE `sub_categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categorias_categoria_id_foreign` (`categoria_id`);

--
-- Índices de tabela `sub_categoria_ecommerces`
--
ALTER TABLE `sub_categoria_ecommerces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categoria_ecommerces_categoria_id_foreign` (`categoria_id`);

--
-- Índices de tabela `suprimento_caixas`
--
ALTER TABLE `suprimento_caixas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suprimento_caixas_empresa_id_foreign` (`empresa_id`),
  ADD KEY `suprimento_caixas_usuario_id_foreign` (`usuario_id`);

--
-- Índices de tabela `system_updates`
--
ALTER TABLE `system_updates`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tamanho_pizzas`
--
ALTER TABLE `tamanho_pizzas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tamanho_pizzas_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `tela_pedidos`
--
ALTER TABLE `tela_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tela_pedidos_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `tema_usuarios`
--
ALTER TABLE `tema_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tema_usuarios_usuario_id_foreign` (`usuario_id`);

--
-- Índices de tabela `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `ticket_mensagems`
--
ALTER TABLE `ticket_mensagems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_mensagems_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_mensagems_usuario_id_foreign` (`usuario_id`);

--
-- Índices de tabela `token_cliente_deliveries`
--
ALTER TABLE `token_cliente_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `token_cliente_deliveries_cliente_id_foreign` (`cliente_id`);

--
-- Índices de tabela `token_webs`
--
ALTER TABLE `token_webs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `token_webs_cliente_id_foreign` (`cliente_id`);

--
-- Índices de tabela `transportadoras`
--
ALTER TABLE `transportadoras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transportadoras_empresa_id_foreign` (`empresa_id`),
  ADD KEY `transportadoras_cidade_id_foreign` (`cidade_id`);

--
-- Índices de tabela `tributacaos`
--
ALTER TABLE `tributacaos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tributacaos_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `tributacao_ufs`
--
ALTER TABLE `tributacao_ufs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tributacao_ufs_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `troca_vendas`
--
ALTER TABLE `troca_vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `troca_vendas_empresa_id_foreign` (`empresa_id`),
  ADD KEY `troca_vendas_cliente_id_foreign` (`cliente_id`),
  ADD KEY `troca_vendas_usuario_id_foreign` (`usuario_id`);

--
-- Índices de tabela `troca_venda_caixas`
--
ALTER TABLE `troca_venda_caixas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `troca_venda_caixas_empresa_id_foreign` (`empresa_id`),
  ADD KEY `troca_venda_caixas_antiga_venda_caixas_id_foreign` (`antiga_venda_caixas_id`),
  ADD KEY `troca_venda_caixas_nova_venda_caixas_id_foreign` (`nova_venda_caixas_id`);

--
-- Índices de tabela `troca_venda_items`
--
ALTER TABLE `troca_venda_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `troca_venda_items_troca_id_foreign` (`troca_id`),
  ADD KEY `troca_venda_items_produto_id_foreign` (`produto_id`);

--
-- Índices de tabela `unidade_cargas`
--
ALTER TABLE `unidade_cargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unidade_cargas_info_id_foreign` (`info_id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `usuario_acessos`
--
ALTER TABLE `usuario_acessos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_acessos_usuario_id_foreign` (`usuario_id`);

--
-- Índices de tabela `vale_pedagios`
--
ALTER TABLE `vale_pedagios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vale_pedagios_mdfe_id_foreign` (`mdfe_id`);

--
-- Índices de tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `veiculos_empresa_id_foreign` (`empresa_id`);

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendas_empresa_id_foreign` (`empresa_id`),
  ADD KEY `vendas_cliente_id_foreign` (`cliente_id`),
  ADD KEY `vendas_usuario_id_foreign` (`usuario_id`),
  ADD KEY `vendas_natureza_id_foreign` (`natureza_id`),
  ADD KEY `vendas_frete_id_foreign` (`frete_id`),
  ADD KEY `vendas_transportadora_id_foreign` (`transportadora_id`),
  ADD KEY `vendas_filial_id_foreign` (`filial_id`);

--
-- Índices de tabela `venda_caixas`
--
ALTER TABLE `venda_caixas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venda_caixas_empresa_id_foreign` (`empresa_id`),
  ADD KEY `venda_caixas_cliente_id_foreign` (`cliente_id`),
  ADD KEY `venda_caixas_usuario_id_foreign` (`usuario_id`),
  ADD KEY `venda_caixas_natureza_id_foreign` (`natureza_id`),
  ADD KEY `venda_caixas_filial_id_foreign` (`filial_id`);

--
-- Índices de tabela `venda_caixa_pre_vendas`
--
ALTER TABLE `venda_caixa_pre_vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venda_caixa_pre_vendas_empresa_id_foreign` (`empresa_id`),
  ADD KEY `venda_caixa_pre_vendas_cliente_id_foreign` (`cliente_id`),
  ADD KEY `venda_caixa_pre_vendas_usuario_id_foreign` (`usuario_id`),
  ADD KEY `venda_caixa_pre_vendas_funcionario_id_foreign` (`funcionario_id`),
  ADD KEY `venda_caixa_pre_vendas_natureza_id_foreign` (`natureza_id`);

--
-- Índices de tabela `video_ajudas`
--
ALTER TABLE `video_ajudas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `xml_enviados`
--
ALTER TABLE `xml_enviados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `xml_enviados_empresa_id_foreign` (`empresa_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `abertura_caixas`
--
ALTER TABLE `abertura_caixas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `acessors`
--
ALTER TABLE `acessors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `alertas`
--
ALTER TABLE `alertas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `alteracao_estoques`
--
ALTER TABLE `alteracao_estoques`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `apk_comandas`
--
ALTER TABLE `apk_comandas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `apontamentos`
--
ALTER TABLE `apontamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `apuracao_mensals`
--
ALTER TABLE `apuracao_mensals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `apuracao_salario_eventos`
--
ALTER TABLE `apuracao_salario_eventos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `atividade_eventos`
--
ALTER TABLE `atividade_eventos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `atividade_servicos`
--
ALTER TABLE `atividade_servicos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `autor_post_blog_ecommerces`
--
ALTER TABLE `autor_post_blog_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bairro_deliveries`
--
ALTER TABLE `bairro_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bairro_delivery_lojas`
--
ALTER TABLE `bairro_delivery_lojas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `banner_mais_vendidos`
--
ALTER TABLE `banner_mais_vendidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `banner_topos`
--
ALTER TABLE `banner_topos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `boletos`
--
ALTER TABLE `boletos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `carrossel_deliveries`
--
ALTER TABLE `carrossel_deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `carrossel_ecommerces`
--
ALTER TABLE `carrossel_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `categoria_contas`
--
ALTER TABLE `categoria_contas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `categoria_despesa_ctes`
--
ALTER TABLE `categoria_despesa_ctes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria_destaque_master_deliveries`
--
ALTER TABLE `categoria_destaque_master_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria_empresas`
--
ALTER TABLE `categoria_empresas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria_loja_segmentos`
--
ALTER TABLE `categoria_loja_segmentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria_master_deliveries`
--
ALTER TABLE `categoria_master_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria_post_blog_ecommerces`
--
ALTER TABLE `categoria_post_blog_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria_produto_deliveries`
--
ALTER TABLE `categoria_produto_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria_produto_ecommerces`
--
ALTER TABLE `categoria_produto_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria_servicos`
--
ALTER TABLE `categoria_servicos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `certificados`
--
ALTER TABLE `certificados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `chave_nfe_ctes`
--
ALTER TABLE `chave_nfe_ctes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cidades`
--
ALTER TABLE `cidades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5571;

--
-- AUTO_INCREMENT de tabela `cidade_deliveries`
--
ALTER TABLE `cidade_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ciots`
--
ALTER TABLE `ciots`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `cliente_deliveries`
--
ALTER TABLE `cliente_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente_ecommerces`
--
ALTER TABLE `cliente_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `codigo_descontos`
--
ALTER TABLE `codigo_descontos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `comissao_vendas`
--
ALTER TABLE `comissao_vendas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `complemento_deliveries`
--
ALTER TABLE `complemento_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `componente_ctes`
--
ALTER TABLE `componente_ctes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `compra_referencias`
--
ALTER TABLE `compra_referencias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `config_caixas`
--
ALTER TABLE `config_caixas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `config_ecommerces`
--
ALTER TABLE `config_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `config_notas`
--
ALTER TABLE `config_notas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `contadors`
--
ALTER TABLE `contadors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contato_ecommerces`
--
ALTER TABLE `contato_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contato_funcionarios`
--
ALTER TABLE `contato_funcionarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `conta_bancarias`
--
ALTER TABLE `conta_bancarias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `conta_pagars`
--
ALTER TABLE `conta_pagars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `conta_recebers`
--
ALTER TABLE `conta_recebers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `contigencias`
--
ALTER TABLE `contigencias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contratos`
--
ALTER TABLE `contratos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cotacaos`
--
ALTER TABLE `cotacaos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `credito_vendas`
--
ALTER TABLE `credito_vendas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ctes`
--
ALTER TABLE `ctes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cte_os`
--
ALTER TABLE `cte_os`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cupom_desconto_ecommerces`
--
ALTER TABLE `cupom_desconto_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `curtida_produto_ecommerces`
--
ALTER TABLE `curtida_produto_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `c_te_descargas`
--
ALTER TABLE `c_te_descargas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `delivery_configs`
--
ALTER TABLE `delivery_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `delivery_config_galerias`
--
ALTER TABLE `delivery_config_galerias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `despesa_ctes`
--
ALTER TABLE `despesa_ctes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `destaque_deliveries`
--
ALTER TABLE `destaque_deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `destaque_delivery_masters`
--
ALTER TABLE `destaque_delivery_masters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `devolucaos`
--
ALTER TABLE `devolucaos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `divisao_grades`
--
ALTER TABLE `divisao_grades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dres`
--
ALTER TABLE `dres`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dre_categorias`
--
ALTER TABLE `dre_categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `empresa_contratos`
--
ALTER TABLE `empresa_contratos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco_deliveries`
--
ALTER TABLE `endereco_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco_ecommerces`
--
ALTER TABLE `endereco_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `erro_logs`
--
ALTER TABLE `erro_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `escritorio_contabils`
--
ALTER TABLE `escritorio_contabils`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estoques`
--
ALTER TABLE `estoques`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `etiquetas`
--
ALTER TABLE `etiquetas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `evento_funcionarios`
--
ALTER TABLE `evento_funcionarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `evento_salarios`
--
ALTER TABLE `evento_salarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fatura_frente_caixas`
--
ALTER TABLE `fatura_frente_caixas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `fatura_orcamentos`
--
ALTER TABLE `fatura_orcamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fatura_pre_vendas`
--
ALTER TABLE `fatura_pre_vendas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `filials`
--
ALTER TABLE `filials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `financeiro_representantes`
--
ALTER TABLE `financeiro_representantes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `forma_pagamentos`
--
ALTER TABLE `forma_pagamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `fornecedors`
--
ALTER TABLE `fornecedors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `fretes`
--
ALTER TABLE `fretes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionamento_deliveries`
--
ALTER TABLE `funcionamento_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `funcionario_eventos`
--
ALTER TABLE `funcionario_eventos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionario_os`
--
ALTER TABLE `funcionario_os`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `grupo_clientes`
--
ALTER TABLE `grupo_clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `imagem_produto_ecommerces`
--
ALTER TABLE `imagem_produto_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `imagens_produto_deliveries`
--
ALTER TABLE `imagens_produto_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `informativo_ecommerces`
--
ALTER TABLE `informativo_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `info_descargas`
--
ALTER TABLE `info_descargas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `inutiliza_nves`
--
ALTER TABLE `inutiliza_nves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `inventarios`
--
ALTER TABLE `inventarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_agendamentos`
--
ALTER TABLE `item_agendamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_compras`
--
ALTER TABLE `item_compras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_cotacaos`
--
ALTER TABLE `item_cotacaos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_devolucaos`
--
ALTER TABLE `item_devolucaos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_dves`
--
ALTER TABLE `item_dves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_inventarios`
--
ALTER TABLE `item_inventarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_i_b_t_es`
--
ALTER TABLE `item_i_b_t_es`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_locacaos`
--
ALTER TABLE `item_locacaos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_locacao_disponibilidades`
--
ALTER TABLE `item_locacao_disponibilidades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_orcamentos`
--
ALTER TABLE `item_orcamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `item_pack_produto_deliveries`
--
ALTER TABLE `item_pack_produto_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_pedidos`
--
ALTER TABLE `item_pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `item_pedido_complemento_deliveries`
--
ALTER TABLE `item_pedido_complemento_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_pedido_complemento_locals`
--
ALTER TABLE `item_pedido_complemento_locals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_pedido_deliveries`
--
ALTER TABLE `item_pedido_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_pedido_ecommerces`
--
ALTER TABLE `item_pedido_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_pizza_pedidos`
--
ALTER TABLE `item_pizza_pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_pizza_pedido_locals`
--
ALTER TABLE `item_pizza_pedido_locals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_receitas`
--
ALTER TABLE `item_receitas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_remessa_nves`
--
ALTER TABLE `item_remessa_nves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_vendas`
--
ALTER TABLE `item_vendas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `item_venda_caixas`
--
ALTER TABLE `item_venda_caixas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `item_venda_caixa_pre_vendas`
--
ALTER TABLE `item_venda_caixa_pre_vendas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `i_b_p_ts`
--
ALTER TABLE `i_b_p_ts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lacre_transportes`
--
ALTER TABLE `lacre_transportes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lacre_unidade_cargas`
--
ALTER TABLE `lacre_unidade_cargas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lancamento_categorias`
--
ALTER TABLE `lancamento_categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lista_complemento_deliveries`
--
ALTER TABLE `lista_complemento_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lista_precos`
--
ALTER TABLE `lista_precos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `locacaos`
--
ALTER TABLE `locacaos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `manifesta_ctes`
--
ALTER TABLE `manifesta_ctes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `manifesta_dves`
--
ALTER TABLE `manifesta_dves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `manifesto_dias`
--
ALTER TABLE `manifesto_dias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `mdves`
--
ALTER TABLE `mdves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `medida_ctes`
--
ALTER TABLE `medida_ctes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mercado_configs`
--
ALTER TABLE `mercado_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT de tabela `motoboys`
--
ALTER TABLE `motoboys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `movimentacao_finaneiras`
--
ALTER TABLE `movimentacao_finaneiras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `municipio_carregamentos`
--
ALTER TABLE `municipio_carregamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `natureza_operacaos`
--
ALTER TABLE `natureza_operacaos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `nfses`
--
ALTER TABLE `nfses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `nfse_servicos`
--
ALTER TABLE `nfse_servicos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `nuvem_shop_configs`
--
ALTER TABLE `nuvem_shop_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `nuvem_shop_item_pedidos`
--
ALTER TABLE `nuvem_shop_item_pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `nuvem_shop_pedidos`
--
ALTER TABLE `nuvem_shop_pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `n_fe_descargas`
--
ALTER TABLE `n_fe_descargas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `n_fe_referecias`
--
ALTER TABLE `n_fe_referecias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `orcamentos`
--
ALTER TABLE `orcamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `ordem_servicos`
--
ALTER TABLE `ordem_servicos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `pack_produto_deliveries`
--
ALTER TABLE `pack_produto_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pais`
--
ALTER TABLE `pais`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT de tabela `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `pedido_deletes`
--
ALTER TABLE `pedido_deletes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pedido_deliveries`
--
ALTER TABLE `pedido_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_ecommerces`
--
ALTER TABLE `pedido_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_motoboys`
--
ALTER TABLE `pedido_motoboys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_pag_seguros`
--
ALTER TABLE `pedido_pag_seguros`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_qr_code_clientes`
--
ALTER TABLE `pedido_qr_code_clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `percursos`
--
ALTER TABLE `percursos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `perfil_acessos`
--
ALTER TABLE `perfil_acessos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pesquisas`
--
ALTER TABLE `pesquisas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `planos`
--
ALTER TABLE `planos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `plano_empresas`
--
ALTER TABLE `plano_empresas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `plano_empresa_representantes`
--
ALTER TABLE `plano_empresa_representantes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `post_blog_ecommerces`
--
ALTER TABLE `post_blog_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `produto_deliveries`
--
ALTER TABLE `produto_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_destaque_master_deliveries`
--
ALTER TABLE `produto_destaque_master_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_ecommerces`
--
ALTER TABLE `produto_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_favorito_deliveries`
--
ALTER TABLE `produto_favorito_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_ibpts`
--
ALTER TABLE `produto_ibpts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_lista_precos`
--
ALTER TABLE `produto_lista_precos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_os`
--
ALTER TABLE `produto_os`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `produto_pizzas`
--
ALTER TABLE `produto_pizzas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pushes`
--
ALTER TABLE `pushes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `receitas`
--
ALTER TABLE `receitas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `receita_ctes`
--
ALTER TABLE `receita_ctes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `record_logs`
--
ALTER TABLE `record_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `relatorio_os`
--
ALTER TABLE `relatorio_os`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `remessas`
--
ALTER TABLE `remessas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `remessa_boletos`
--
ALTER TABLE `remessa_boletos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `remessa_nfe_faturas`
--
ALTER TABLE `remessa_nfe_faturas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `remessa_nves`
--
ALTER TABLE `remessa_nves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `remessa_referencia_nves`
--
ALTER TABLE `remessa_referencia_nves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `representantes`
--
ALTER TABLE `representantes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `representante_empresas`
--
ALTER TABLE `representante_empresas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sangria_caixas`
--
ALTER TABLE `sangria_caixas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `servico_os`
--
ALTER TABLE `servico_os`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `sub_categorias`
--
ALTER TABLE `sub_categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `sub_categoria_ecommerces`
--
ALTER TABLE `sub_categoria_ecommerces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `suprimento_caixas`
--
ALTER TABLE `suprimento_caixas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `system_updates`
--
ALTER TABLE `system_updates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tamanho_pizzas`
--
ALTER TABLE `tamanho_pizzas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tela_pedidos`
--
ALTER TABLE `tela_pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tema_usuarios`
--
ALTER TABLE `tema_usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ticket_mensagems`
--
ALTER TABLE `ticket_mensagems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `token_cliente_deliveries`
--
ALTER TABLE `token_cliente_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `token_webs`
--
ALTER TABLE `token_webs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `transportadoras`
--
ALTER TABLE `transportadoras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tributacaos`
--
ALTER TABLE `tributacaos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tributacao_ufs`
--
ALTER TABLE `tributacao_ufs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `troca_vendas`
--
ALTER TABLE `troca_vendas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `troca_venda_caixas`
--
ALTER TABLE `troca_venda_caixas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `troca_venda_items`
--
ALTER TABLE `troca_venda_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `unidade_cargas`
--
ALTER TABLE `unidade_cargas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `usuario_acessos`
--
ALTER TABLE `usuario_acessos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `vale_pedagios`
--
ALTER TABLE `vale_pedagios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `veiculos`
--
ALTER TABLE `veiculos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `venda_caixas`
--
ALTER TABLE `venda_caixas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `venda_caixa_pre_vendas`
--
ALTER TABLE `venda_caixa_pre_vendas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `video_ajudas`
--
ALTER TABLE `video_ajudas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `xml_enviados`
--
ALTER TABLE `xml_enviados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `abertura_caixas`
--
ALTER TABLE `abertura_caixas`
  ADD CONSTRAINT `abertura_caixas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `abertura_caixas_filial_id_foreign` FOREIGN KEY (`filial_id`) REFERENCES `filials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `abertura_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `acessors`
--
ALTER TABLE `acessors`
  ADD CONSTRAINT `acessors_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `acessors_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD CONSTRAINT `agendamentos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `agendamentos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `agendamentos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);

--
-- Restrições para tabelas `alteracao_estoques`
--
ALTER TABLE `alteracao_estoques`
  ADD CONSTRAINT `alteracao_estoques_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `alteracao_estoques_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `alteracao_estoques_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `apk_comandas`
--
ALTER TABLE `apk_comandas`
  ADD CONSTRAINT `apk_comandas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `apontamentos`
--
ALTER TABLE `apontamentos`
  ADD CONSTRAINT `apontamentos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `apontamentos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `apontamentos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `apuracao_mensals`
--
ALTER TABLE `apuracao_mensals`
  ADD CONSTRAINT `apuracao_mensals_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `apuracao_salario_eventos`
--
ALTER TABLE `apuracao_salario_eventos`
  ADD CONSTRAINT `apuracao_salario_eventos_apuracao_id_foreign` FOREIGN KEY (`apuracao_id`) REFERENCES `apuracao_mensals` (`id`),
  ADD CONSTRAINT `apuracao_salario_eventos_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `evento_salarios` (`id`);

--
-- Restrições para tabelas `atividade_eventos`
--
ALTER TABLE `atividade_eventos`
  ADD CONSTRAINT `atividade_eventos_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `atividade_eventos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `atividade_servicos`
--
ALTER TABLE `atividade_servicos`
  ADD CONSTRAINT `atividade_servicos_atividade_id_foreign` FOREIGN KEY (`atividade_id`) REFERENCES `atividade_eventos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `atividade_servicos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `autor_post_blog_ecommerces`
--
ALTER TABLE `autor_post_blog_ecommerces`
  ADD CONSTRAINT `autor_post_blog_ecommerces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `bairro_deliveries`
--
ALTER TABLE `bairro_deliveries`
  ADD CONSTRAINT `bairro_deliveries_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidade_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `bairro_delivery_lojas`
--
ALTER TABLE `bairro_delivery_lojas`
  ADD CONSTRAINT `bairro_delivery_lojas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `banner_mais_vendidos`
--
ALTER TABLE `banner_mais_vendidos`
  ADD CONSTRAINT `banner_mais_vendidos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `banner_mais_vendidos_pack_id_foreign` FOREIGN KEY (`pack_id`) REFERENCES `pack_produto_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `banner_mais_vendidos_produto_delivery_id_foreign` FOREIGN KEY (`produto_delivery_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `banner_topos`
--
ALTER TABLE `banner_topos`
  ADD CONSTRAINT `banner_topos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `banner_topos_pack_id_foreign` FOREIGN KEY (`pack_id`) REFERENCES `pack_produto_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `banner_topos_produto_delivery_id_foreign` FOREIGN KEY (`produto_delivery_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `boletos`
--
ALTER TABLE `boletos`
  ADD CONSTRAINT `boletos_banco_id_foreign` FOREIGN KEY (`banco_id`) REFERENCES `conta_bancarias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `boletos_conta_id_foreign` FOREIGN KEY (`conta_id`) REFERENCES `conta_recebers` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `carrossel_deliveries`
--
ALTER TABLE `carrossel_deliveries`
  ADD CONSTRAINT `carrossel_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `carrossel_ecommerces`
--
ALTER TABLE `carrossel_ecommerces`
  ADD CONSTRAINT `carrossel_ecommerces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `categoria_contas`
--
ALTER TABLE `categoria_contas`
  ADD CONSTRAINT `categoria_contas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `categoria_despesa_ctes`
--
ALTER TABLE `categoria_despesa_ctes`
  ADD CONSTRAINT `categoria_despesa_ctes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `categoria_empresas`
--
ALTER TABLE `categoria_empresas`
  ADD CONSTRAINT `categoria_empresas_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_master_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categoria_empresas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `categoria_loja_segmentos`
--
ALTER TABLE `categoria_loja_segmentos`
  ADD CONSTRAINT `categoria_loja_segmentos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_master_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categoria_loja_segmentos_loja_id_foreign` FOREIGN KEY (`loja_id`) REFERENCES `delivery_configs` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `categoria_post_blog_ecommerces`
--
ALTER TABLE `categoria_post_blog_ecommerces`
  ADD CONSTRAINT `categoria_post_blog_ecommerces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `categoria_produto_deliveries`
--
ALTER TABLE `categoria_produto_deliveries`
  ADD CONSTRAINT `categoria_produto_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `categoria_produto_ecommerces`
--
ALTER TABLE `categoria_produto_ecommerces`
  ADD CONSTRAINT `categoria_produto_ecommerces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `categoria_servicos`
--
ALTER TABLE `categoria_servicos`
  ADD CONSTRAINT `categoria_servicos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `certificados`
--
ALTER TABLE `certificados`
  ADD CONSTRAINT `certificados_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `chave_nfe_ctes`
--
ALTER TABLE `chave_nfe_ctes`
  ADD CONSTRAINT `chave_nfe_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`);

--
-- Restrições para tabelas `ciots`
--
ALTER TABLE `ciots`
  ADD CONSTRAINT `ciots_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_cidade_cobranca_id_foreign` FOREIGN KEY (`cidade_cobranca_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clientes_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clientes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `cliente_deliveries`
--
ALTER TABLE `cliente_deliveries`
  ADD CONSTRAINT `cliente_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `cliente_ecommerces`
--
ALTER TABLE `cliente_ecommerces`
  ADD CONSTRAINT `cliente_ecommerces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `codigo_descontos`
--
ALTER TABLE `codigo_descontos`
  ADD CONSTRAINT `codigo_descontos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `codigo_descontos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `comissao_vendas`
--
ALTER TABLE `comissao_vendas`
  ADD CONSTRAINT `comissao_vendas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comissao_vendas_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `complemento_deliveries`
--
ALTER TABLE `complemento_deliveries`
  ADD CONSTRAINT `complemento_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `componente_ctes`
--
ALTER TABLE `componente_ctes`
  ADD CONSTRAINT `componente_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compras_filial_id_foreign` FOREIGN KEY (`filial_id`) REFERENCES `filials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compras_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compras_transportadora_id_foreign` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compras_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `compra_referencias`
--
ALTER TABLE `compra_referencias`
  ADD CONSTRAINT `compra_referencias_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `config_caixas`
--
ALTER TABLE `config_caixas`
  ADD CONSTRAINT `config_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `config_ecommerces`
--
ALTER TABLE `config_ecommerces`
  ADD CONSTRAINT `config_ecommerces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `config_notas`
--
ALTER TABLE `config_notas`
  ADD CONSTRAINT `config_notas_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `config_notas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `contato_ecommerces`
--
ALTER TABLE `contato_ecommerces`
  ADD CONSTRAINT `contato_ecommerces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `contato_funcionarios`
--
ALTER TABLE `contato_funcionarios`
  ADD CONSTRAINT `contato_funcionarios_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);

--
-- Restrições para tabelas `conta_bancarias`
--
ALTER TABLE `conta_bancarias`
  ADD CONSTRAINT `conta_bancarias_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conta_bancarias_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `conta_pagars`
--
ALTER TABLE `conta_pagars`
  ADD CONSTRAINT `conta_pagars_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_contas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conta_pagars_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conta_pagars_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conta_pagars_filial_id_foreign` FOREIGN KEY (`filial_id`) REFERENCES `filials` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `conta_recebers`
--
ALTER TABLE `conta_recebers`
  ADD CONSTRAINT `conta_recebers_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_contas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conta_recebers_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conta_recebers_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conta_recebers_filial_id_foreign` FOREIGN KEY (`filial_id`) REFERENCES `filials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conta_recebers_venda_caixa_id_foreign` FOREIGN KEY (`venda_caixa_id`) REFERENCES `venda_caixas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conta_recebers_venda_id_foreign` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `contigencias`
--
ALTER TABLE `contigencias`
  ADD CONSTRAINT `contigencias_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `cotacaos`
--
ALTER TABLE `cotacaos`
  ADD CONSTRAINT `cotacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cotacaos_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`);

--
-- Restrições para tabelas `credito_vendas`
--
ALTER TABLE `credito_vendas`
  ADD CONSTRAINT `credito_vendas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `credito_vendas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `credito_vendas_venda_id_foreign` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `ctes`
--
ALTER TABLE `ctes`
  ADD CONSTRAINT `ctes_destinatario_id_foreign` FOREIGN KEY (`destinatario_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `ctes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ctes_expedidor_id_foreign` FOREIGN KEY (`expedidor_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `ctes_filial_id_foreign` FOREIGN KEY (`filial_id`) REFERENCES `filials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ctes_municipio_envio_foreign` FOREIGN KEY (`municipio_envio`) REFERENCES `cidades` (`id`),
  ADD CONSTRAINT `ctes_municipio_fim_foreign` FOREIGN KEY (`municipio_fim`) REFERENCES `cidades` (`id`),
  ADD CONSTRAINT `ctes_municipio_inicio_foreign` FOREIGN KEY (`municipio_inicio`) REFERENCES `cidades` (`id`),
  ADD CONSTRAINT `ctes_municipio_tomador_foreign` FOREIGN KEY (`municipio_tomador`) REFERENCES `cidades` (`id`),
  ADD CONSTRAINT `ctes_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  ADD CONSTRAINT `ctes_recebedor_id_foreign` FOREIGN KEY (`recebedor_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `ctes_remetente_id_foreign` FOREIGN KEY (`remetente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `ctes_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `ctes_veiculo_id_foreign` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculos` (`id`);

--
-- Restrições para tabelas `cte_os`
--
ALTER TABLE `cte_os`
  ADD CONSTRAINT `cte_os_emitente_id_foreign` FOREIGN KEY (`emitente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `cte_os_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cte_os_municipio_envio_foreign` FOREIGN KEY (`municipio_envio`) REFERENCES `cidades` (`id`),
  ADD CONSTRAINT `cte_os_municipio_fim_foreign` FOREIGN KEY (`municipio_fim`) REFERENCES `cidades` (`id`),
  ADD CONSTRAINT `cte_os_municipio_inicio_foreign` FOREIGN KEY (`municipio_inicio`) REFERENCES `cidades` (`id`),
  ADD CONSTRAINT `cte_os_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  ADD CONSTRAINT `cte_os_tomador_id_foreign` FOREIGN KEY (`tomador_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `cte_os_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `cte_os_veiculo_id_foreign` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculos` (`id`);

--
-- Restrições para tabelas `cupom_desconto_ecommerces`
--
ALTER TABLE `cupom_desconto_ecommerces`
  ADD CONSTRAINT `cupom_desconto_ecommerces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `curtida_produto_ecommerces`
--
ALTER TABLE `curtida_produto_ecommerces`
  ADD CONSTRAINT `curtida_produto_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_ecommerces` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `curtida_produto_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_ecommerces` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `c_te_descargas`
--
ALTER TABLE `c_te_descargas`
  ADD CONSTRAINT `c_te_descargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `delivery_configs`
--
ALTER TABLE `delivery_configs`
  ADD CONSTRAINT `delivery_configs_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidade_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `delivery_config_galerias`
--
ALTER TABLE `delivery_config_galerias`
  ADD CONSTRAINT `delivery_config_galerias_config_id_foreign` FOREIGN KEY (`config_id`) REFERENCES `delivery_configs` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `despesa_ctes`
--
ALTER TABLE `despesa_ctes`
  ADD CONSTRAINT `despesa_ctes_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_despesa_ctes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `despesa_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `destaque_deliveries`
--
ALTER TABLE `destaque_deliveries`
  ADD CONSTRAINT `destaque_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `destaque_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `devolucaos`
--
ALTER TABLE `devolucaos`
  ADD CONSTRAINT `devolucaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `devolucaos_filial_id_foreign` FOREIGN KEY (`filial_id`) REFERENCES `filials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `devolucaos_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`),
  ADD CONSTRAINT `devolucaos_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  ADD CONSTRAINT `devolucaos_transportadora_id_foreign` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`),
  ADD CONSTRAINT `devolucaos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `divisao_grades`
--
ALTER TABLE `divisao_grades`
  ADD CONSTRAINT `divisao_grades_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `dres`
--
ALTER TABLE `dres`
  ADD CONSTRAINT `dres_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `dre_categorias`
--
ALTER TABLE `dre_categorias`
  ADD CONSTRAINT `dre_categorias_dre_id_foreign` FOREIGN KEY (`dre_id`) REFERENCES `dres` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `empresa_contratos`
--
ALTER TABLE `empresa_contratos`
  ADD CONSTRAINT `empresa_contratos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `endereco_deliveries`
--
ALTER TABLE `endereco_deliveries`
  ADD CONSTRAINT `endereco_deliveries_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidade_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `endereco_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `endereco_ecommerces`
--
ALTER TABLE `endereco_ecommerces`
  ADD CONSTRAINT `endereco_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_ecommerces` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `erro_logs`
--
ALTER TABLE `erro_logs`
  ADD CONSTRAINT `erro_logs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `escritorio_contabils`
--
ALTER TABLE `escritorio_contabils`
  ADD CONSTRAINT `escritorio_contabils_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `estoques`
--
ALTER TABLE `estoques`
  ADD CONSTRAINT `estoques_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `estoques_filial_id_foreign` FOREIGN KEY (`filial_id`) REFERENCES `filials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `estoques_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `etiquetas`
--
ALTER TABLE `etiquetas`
  ADD CONSTRAINT `etiquetas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `evento_funcionarios`
--
ALTER TABLE `evento_funcionarios`
  ADD CONSTRAINT `evento_funcionarios_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `evento_funcionarios_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `evento_salarios`
--
ALTER TABLE `evento_salarios`
  ADD CONSTRAINT `evento_salarios_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `fatura_frente_caixas`
--
ALTER TABLE `fatura_frente_caixas`
  ADD CONSTRAINT `fatura_frente_caixas_venda_caixa_id_foreign` FOREIGN KEY (`venda_caixa_id`) REFERENCES `venda_caixas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `fatura_orcamentos`
--
ALTER TABLE `fatura_orcamentos`
  ADD CONSTRAINT `fatura_orcamentos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fatura_orcamentos_orcamento_id_foreign` FOREIGN KEY (`orcamento_id`) REFERENCES `orcamentos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `fatura_pre_vendas`
--
ALTER TABLE `fatura_pre_vendas`
  ADD CONSTRAINT `fatura_pre_vendas_pre_venda_id_foreign` FOREIGN KEY (`pre_venda_id`) REFERENCES `venda_caixa_pre_vendas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `filials`
--
ALTER TABLE `filials`
  ADD CONSTRAINT `filials_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `filials_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `financeiro_representantes`
--
ALTER TABLE `financeiro_representantes`
  ADD CONSTRAINT `financeiro_representantes_representante_empresa_id_foreign` FOREIGN KEY (`representante_empresa_id`) REFERENCES `representante_empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `forma_pagamentos`
--
ALTER TABLE `forma_pagamentos`
  ADD CONSTRAINT `forma_pagamentos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `fornecedors`
--
ALTER TABLE `fornecedors`
  ADD CONSTRAINT `fornecedors_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fornecedors_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `funcionamento_deliveries`
--
ALTER TABLE `funcionamento_deliveries`
  ADD CONSTRAINT `funcionamento_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `funcionarios_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `funcionarios_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `funcionarios_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `funcionario_eventos`
--
ALTER TABLE `funcionario_eventos`
  ADD CONSTRAINT `funcionario_eventos_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `evento_salarios` (`id`),
  ADD CONSTRAINT `funcionario_eventos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `funcionario_os`
--
ALTER TABLE `funcionario_os`
  ADD CONSTRAINT `funcionario_os_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`),
  ADD CONSTRAINT `funcionario_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`),
  ADD CONSTRAINT `funcionario_os_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `grupo_clientes`
--
ALTER TABLE `grupo_clientes`
  ADD CONSTRAINT `grupo_clientes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `imagem_produto_ecommerces`
--
ALTER TABLE `imagem_produto_ecommerces`
  ADD CONSTRAINT `imagem_produto_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_ecommerces` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `imagens_produto_deliveries`
--
ALTER TABLE `imagens_produto_deliveries`
  ADD CONSTRAINT `imagens_produto_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `informativo_ecommerces`
--
ALTER TABLE `informativo_ecommerces`
  ADD CONSTRAINT `informativo_ecommerces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `info_descargas`
--
ALTER TABLE `info_descargas`
  ADD CONSTRAINT `info_descargas_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `info_descargas_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `inutiliza_nves`
--
ALTER TABLE `inutiliza_nves`
  ADD CONSTRAINT `inutiliza_nves_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `inventarios`
--
ALTER TABLE `inventarios`
  ADD CONSTRAINT `inventarios_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_agendamentos`
--
ALTER TABLE `item_agendamentos`
  ADD CONSTRAINT `item_agendamentos_agendamento_id_foreign` FOREIGN KEY (`agendamento_id`) REFERENCES `agendamentos` (`id`),
  ADD CONSTRAINT `item_agendamentos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`);

--
-- Restrições para tabelas `item_compras`
--
ALTER TABLE `item_compras`
  ADD CONSTRAINT `item_compras_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`),
  ADD CONSTRAINT `item_compras_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Restrições para tabelas `item_cotacaos`
--
ALTER TABLE `item_cotacaos`
  ADD CONSTRAINT `item_cotacaos_cotacao_id_foreign` FOREIGN KEY (`cotacao_id`) REFERENCES `cotacaos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_cotacaos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Restrições para tabelas `item_devolucaos`
--
ALTER TABLE `item_devolucaos`
  ADD CONSTRAINT `item_devolucaos_devolucao_id_foreign` FOREIGN KEY (`devolucao_id`) REFERENCES `devolucaos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_dves`
--
ALTER TABLE `item_dves`
  ADD CONSTRAINT `item_dves_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_inventarios`
--
ALTER TABLE `item_inventarios`
  ADD CONSTRAINT `item_inventarios_inventario_id_foreign` FOREIGN KEY (`inventario_id`) REFERENCES `inventarios` (`id`),
  ADD CONSTRAINT `item_inventarios_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `item_inventarios_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_i_b_t_es`
--
ALTER TABLE `item_i_b_t_es`
  ADD CONSTRAINT `item_i_b_t_es_ibte_id_foreign` FOREIGN KEY (`ibte_id`) REFERENCES `i_b_p_ts` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_locacaos`
--
ALTER TABLE `item_locacaos`
  ADD CONSTRAINT `item_locacaos_locacao_id_foreign` FOREIGN KEY (`locacao_id`) REFERENCES `locacaos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_locacaos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_locacao_disponibilidades`
--
ALTER TABLE `item_locacao_disponibilidades`
  ADD CONSTRAINT `item_locacao_disponibilidades_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_orcamentos`
--
ALTER TABLE `item_orcamentos`
  ADD CONSTRAINT `item_orcamentos_orcamento_id_foreign` FOREIGN KEY (`orcamento_id`) REFERENCES `orcamentos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_orcamentos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Restrições para tabelas `item_pack_produto_deliveries`
--
ALTER TABLE `item_pack_produto_deliveries`
  ADD CONSTRAINT `item_pack_produto_deliveries_pack_id_foreign` FOREIGN KEY (`pack_id`) REFERENCES `pack_produto_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pack_produto_deliveries_produto_delivery_id_foreign` FOREIGN KEY (`produto_delivery_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_pedidos`
--
ALTER TABLE `item_pedidos`
  ADD CONSTRAINT `item_pedidos_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pedidos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `item_pedidos_tamanho_pizza_id_foreign` FOREIGN KEY (`tamanho_pizza_id`) REFERENCES `tamanho_pizzas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_pedido_complemento_deliveries`
--
ALTER TABLE `item_pedido_complemento_deliveries`
  ADD CONSTRAINT `item_pedido_complemento_deliveries_complemento_id_foreign` FOREIGN KEY (`complemento_id`) REFERENCES `complemento_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pedido_complemento_deliveries_item_pedido_id_foreign` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedido_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_pedido_complemento_locals`
--
ALTER TABLE `item_pedido_complemento_locals`
  ADD CONSTRAINT `item_pedido_complemento_locals_complemento_id_foreign` FOREIGN KEY (`complemento_id`) REFERENCES `complemento_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pedido_complemento_locals_item_pedido_foreign` FOREIGN KEY (`item_pedido`) REFERENCES `item_pedidos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_pedido_deliveries`
--
ALTER TABLE `item_pedido_deliveries`
  ADD CONSTRAINT `item_pedido_deliveries_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pedido_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pedido_deliveries_tamanho_id_foreign` FOREIGN KEY (`tamanho_id`) REFERENCES `tamanho_pizzas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_pedido_ecommerces`
--
ALTER TABLE `item_pedido_ecommerces`
  ADD CONSTRAINT `item_pedido_ecommerces_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_ecommerces` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pedido_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_ecommerces` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_pizza_pedidos`
--
ALTER TABLE `item_pizza_pedidos`
  ADD CONSTRAINT `item_pizza_pedidos_item_pedido_foreign` FOREIGN KEY (`item_pedido`) REFERENCES `item_pedido_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pizza_pedidos_sabor_id_foreign` FOREIGN KEY (`sabor_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_pizza_pedido_locals`
--
ALTER TABLE `item_pizza_pedido_locals`
  ADD CONSTRAINT `item_pizza_pedido_locals_item_pedido_foreign` FOREIGN KEY (`item_pedido`) REFERENCES `item_pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_pizza_pedido_locals_sabor_id_foreign` FOREIGN KEY (`sabor_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_receitas`
--
ALTER TABLE `item_receitas`
  ADD CONSTRAINT `item_receitas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_receitas_receita_id_foreign` FOREIGN KEY (`receita_id`) REFERENCES `receitas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_remessa_nves`
--
ALTER TABLE `item_remessa_nves`
  ADD CONSTRAINT `item_remessa_nves_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `item_remessa_nves_remessa_id_foreign` FOREIGN KEY (`remessa_id`) REFERENCES `remessa_nves` (`id`);

--
-- Restrições para tabelas `item_vendas`
--
ALTER TABLE `item_vendas`
  ADD CONSTRAINT `item_vendas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `item_vendas_venda_id_foreign` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_venda_caixas`
--
ALTER TABLE `item_venda_caixas`
  ADD CONSTRAINT `item_venda_caixas_item_pedido_id_foreign` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_venda_caixas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `item_venda_caixas_venda_caixa_id_foreign` FOREIGN KEY (`venda_caixa_id`) REFERENCES `venda_caixas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_venda_caixa_pre_vendas`
--
ALTER TABLE `item_venda_caixa_pre_vendas`
  ADD CONSTRAINT `item_venda_caixa_pre_vendas_pre_venda_id_foreign` FOREIGN KEY (`pre_venda_id`) REFERENCES `venda_caixa_pre_vendas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_venda_caixa_pre_vendas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Restrições para tabelas `lacre_transportes`
--
ALTER TABLE `lacre_transportes`
  ADD CONSTRAINT `lacre_transportes_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `lacre_unidade_cargas`
--
ALTER TABLE `lacre_unidade_cargas`
  ADD CONSTRAINT `lacre_unidade_cargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `lancamento_categorias`
--
ALTER TABLE `lancamento_categorias`
  ADD CONSTRAINT `lancamento_categorias_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `dre_categorias` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `lista_complemento_deliveries`
--
ALTER TABLE `lista_complemento_deliveries`
  ADD CONSTRAINT `lista_complemento_deliveries_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_produto_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lista_complemento_deliveries_complemento_id_foreign` FOREIGN KEY (`complemento_id`) REFERENCES `complemento_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `lista_precos`
--
ALTER TABLE `lista_precos`
  ADD CONSTRAINT `lista_precos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `locacaos`
--
ALTER TABLE `locacaos`
  ADD CONSTRAINT `locacaos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `locacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `manifesta_ctes`
--
ALTER TABLE `manifesta_ctes`
  ADD CONSTRAINT `manifesta_ctes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `manifesta_dves`
--
ALTER TABLE `manifesta_dves`
  ADD CONSTRAINT `manifesta_dves_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `manifesta_dves_filial_id_foreign` FOREIGN KEY (`filial_id`) REFERENCES `filials` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `manifesto_dias`
--
ALTER TABLE `manifesto_dias`
  ADD CONSTRAINT `manifesto_dias_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `marcas`
--
ALTER TABLE `marcas`
  ADD CONSTRAINT `marcas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `mdves`
--
ALTER TABLE `mdves`
  ADD CONSTRAINT `mdves_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mdves_filial_id_foreign` FOREIGN KEY (`filial_id`) REFERENCES `filials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mdves_veiculo_reboque2_id_foreign` FOREIGN KEY (`veiculo_reboque2_id`) REFERENCES `veiculos` (`id`),
  ADD CONSTRAINT `mdves_veiculo_reboque3_id_foreign` FOREIGN KEY (`veiculo_reboque3_id`) REFERENCES `veiculos` (`id`),
  ADD CONSTRAINT `mdves_veiculo_reboque_id_foreign` FOREIGN KEY (`veiculo_reboque_id`) REFERENCES `veiculos` (`id`),
  ADD CONSTRAINT `mdves_veiculo_tracao_id_foreign` FOREIGN KEY (`veiculo_tracao_id`) REFERENCES `veiculos` (`id`);

--
-- Restrições para tabelas `medida_ctes`
--
ALTER TABLE `medida_ctes`
  ADD CONSTRAINT `medida_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `mercado_configs`
--
ALTER TABLE `mercado_configs`
  ADD CONSTRAINT `mercado_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `mesas`
--
ALTER TABLE `mesas`
  ADD CONSTRAINT `mesas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `motoboys`
--
ALTER TABLE `motoboys`
  ADD CONSTRAINT `motoboys_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `movimentacao_finaneiras`
--
ALTER TABLE `movimentacao_finaneiras`
  ADD CONSTRAINT `movimentacao_finaneiras_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movimentacao_finaneiras_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `municipio_carregamentos`
--
ALTER TABLE `municipio_carregamentos`
  ADD CONSTRAINT `municipio_carregamentos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `municipio_carregamentos_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `natureza_operacaos`
--
ALTER TABLE `natureza_operacaos`
  ADD CONSTRAINT `natureza_operacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `nfses`
--
ALTER TABLE `nfses`
  ADD CONSTRAINT `nfses_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `nfses_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `nfses_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `nfses_filial_id_foreign` FOREIGN KEY (`filial_id`) REFERENCES `filials` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `nfse_servicos`
--
ALTER TABLE `nfse_servicos`
  ADD CONSTRAINT `nfse_servicos_nfse_id_foreign` FOREIGN KEY (`nfse_id`) REFERENCES `nfses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `nfse_servicos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `nuvem_shop_configs`
--
ALTER TABLE `nuvem_shop_configs`
  ADD CONSTRAINT `nuvem_shop_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `nuvem_shop_item_pedidos`
--
ALTER TABLE `nuvem_shop_item_pedidos`
  ADD CONSTRAINT `nuvem_shop_item_pedidos_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `nuvem_shop_pedidos` (`id`),
  ADD CONSTRAINT `nuvem_shop_item_pedidos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Restrições para tabelas `nuvem_shop_pedidos`
--
ALTER TABLE `nuvem_shop_pedidos`
  ADD CONSTRAINT `nuvem_shop_pedidos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `n_fe_descargas`
--
ALTER TABLE `n_fe_descargas`
  ADD CONSTRAINT `n_fe_descargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `n_fe_referecias`
--
ALTER TABLE `n_fe_referecias`
  ADD CONSTRAINT `n_fe_referecias_venda_id_foreign` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `orcamentos`
--
ALTER TABLE `orcamentos`
  ADD CONSTRAINT `orcamentos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `orcamentos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orcamentos_filial_id_foreign` FOREIGN KEY (`filial_id`) REFERENCES `filials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orcamentos_frete_id_foreign` FOREIGN KEY (`frete_id`) REFERENCES `fretes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orcamentos_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  ADD CONSTRAINT `orcamentos_transportadora_id_foreign` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orcamentos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `ordem_servicos`
--
ALTER TABLE `ordem_servicos`
  ADD CONSTRAINT `ordem_servicos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ordem_servicos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ordem_servicos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_plano_id_foreign` FOREIGN KEY (`plano_id`) REFERENCES `plano_empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_bairro_id_foreign` FOREIGN KEY (`bairro_id`) REFERENCES `bairro_deliveries` (`id`),
  ADD CONSTRAINT `pedidos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `pedidos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedidos_mesa_id_foreign` FOREIGN KEY (`mesa_id`) REFERENCES `mesas` (`id`);

--
-- Restrições para tabelas `pedido_deletes`
--
ALTER TABLE `pedido_deletes`
  ADD CONSTRAINT `pedido_deletes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `pedido_deliveries`
--
ALTER TABLE `pedido_deliveries`
  ADD CONSTRAINT `pedido_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_deliveries_cupom_id_foreign` FOREIGN KEY (`cupom_id`) REFERENCES `codigo_descontos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_deliveries_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `pedido_ecommerces`
--
ALTER TABLE `pedido_ecommerces`
  ADD CONSTRAINT `pedido_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_ecommerces` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_ecommerces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_ecommerces_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_ecommerces` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `pedido_motoboys`
--
ALTER TABLE `pedido_motoboys`
  ADD CONSTRAINT `pedido_motoboys_motoboy_id_foreign` FOREIGN KEY (`motoboy_id`) REFERENCES `motoboys` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_motoboys_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `pedido_pag_seguros`
--
ALTER TABLE `pedido_pag_seguros`
  ADD CONSTRAINT `pedido_pag_seguros_pedido_delivery_id_foreign` FOREIGN KEY (`pedido_delivery_id`) REFERENCES `pedido_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `pedido_qr_code_clientes`
--
ALTER TABLE `pedido_qr_code_clientes`
  ADD CONSTRAINT `pedido_qr_code_clientes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_qr_code_clientes_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `percursos`
--
ALTER TABLE `percursos`
  ADD CONSTRAINT `percursos_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `plano_empresas`
--
ALTER TABLE `plano_empresas`
  ADD CONSTRAINT `plano_empresas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `plano_empresas_plano_id_foreign` FOREIGN KEY (`plano_id`) REFERENCES `planos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `plano_empresa_representantes`
--
ALTER TABLE `plano_empresa_representantes`
  ADD CONSTRAINT `plano_empresa_representantes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `plano_empresa_representantes_plano_id_foreign` FOREIGN KEY (`plano_id`) REFERENCES `planos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `plano_empresa_representantes_representante_id_foreign` FOREIGN KEY (`representante_id`) REFERENCES `representantes` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `post_blog_ecommerces`
--
ALTER TABLE `post_blog_ecommerces`
  ADD CONSTRAINT `post_blog_ecommerces_autor_id_foreign` FOREIGN KEY (`autor_id`) REFERENCES `autor_post_blog_ecommerces` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_blog_ecommerces_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_post_blog_ecommerces` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_blog_ecommerces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produtos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produtos_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produtos_sub_categoria_id_foreign` FOREIGN KEY (`sub_categoria_id`) REFERENCES `sub_categorias` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `produto_deliveries`
--
ALTER TABLE `produto_deliveries`
  ADD CONSTRAINT `produto_deliveries_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_produto_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produto_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produto_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `produto_destaque_master_deliveries`
--
ALTER TABLE `produto_destaque_master_deliveries`
  ADD CONSTRAINT `produto_destaque_master_deliveries_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_destaque_master_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produto_destaque_master_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `produto_ecommerces`
--
ALTER TABLE `produto_ecommerces`
  ADD CONSTRAINT `produto_ecommerces_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_produto_ecommerces` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produto_ecommerces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produto_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `produto_favorito_deliveries`
--
ALTER TABLE `produto_favorito_deliveries`
  ADD CONSTRAINT `produto_favorito_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produto_favorito_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `produto_ibpts`
--
ALTER TABLE `produto_ibpts`
  ADD CONSTRAINT `produto_ibpts_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `produto_lista_precos`
--
ALTER TABLE `produto_lista_precos`
  ADD CONSTRAINT `produto_lista_precos_lista_id_foreign` FOREIGN KEY (`lista_id`) REFERENCES `lista_precos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produto_lista_precos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `produto_os`
--
ALTER TABLE `produto_os`
  ADD CONSTRAINT `produto_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`),
  ADD CONSTRAINT `produto_os_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Restrições para tabelas `produto_pizzas`
--
ALTER TABLE `produto_pizzas`
  ADD CONSTRAINT `produto_pizzas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produto_pizzas_tamanho_id_foreign` FOREIGN KEY (`tamanho_id`) REFERENCES `tamanho_pizzas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `pushes`
--
ALTER TABLE `pushes`
  ADD CONSTRAINT `pushes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pushes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `receitas`
--
ALTER TABLE `receitas`
  ADD CONSTRAINT `receitas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `receita_ctes`
--
ALTER TABLE `receita_ctes`
  ADD CONSTRAINT `receita_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `record_logs`
--
ALTER TABLE `record_logs`
  ADD CONSTRAINT `record_logs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `record_logs_usuario_log_id_foreign` FOREIGN KEY (`usuario_log_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `relatorio_os`
--
ALTER TABLE `relatorio_os`
  ADD CONSTRAINT `relatorio_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`),
  ADD CONSTRAINT `relatorio_os_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `remessas`
--
ALTER TABLE `remessas`
  ADD CONSTRAINT `remessas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `remessa_boletos`
--
ALTER TABLE `remessa_boletos`
  ADD CONSTRAINT `remessa_boletos_boleto_id_foreign` FOREIGN KEY (`boleto_id`) REFERENCES `boletos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `remessa_boletos_remessa_id_foreign` FOREIGN KEY (`remessa_id`) REFERENCES `remessas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `remessa_nfe_faturas`
--
ALTER TABLE `remessa_nfe_faturas`
  ADD CONSTRAINT `remessa_nfe_faturas_remessa_id_foreign` FOREIGN KEY (`remessa_id`) REFERENCES `remessa_nves` (`id`);

--
-- Restrições para tabelas `remessa_nves`
--
ALTER TABLE `remessa_nves`
  ADD CONSTRAINT `remessa_nves_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `remessa_nves_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `remessa_nves_filial_id_foreign` FOREIGN KEY (`filial_id`) REFERENCES `filials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `remessa_nves_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  ADD CONSTRAINT `remessa_nves_transportadora_id_foreign` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `remessa_nves_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `remessa_referencia_nves`
--
ALTER TABLE `remessa_referencia_nves`
  ADD CONSTRAINT `remessa_referencia_nves_remessa_id_foreign` FOREIGN KEY (`remessa_id`) REFERENCES `remessa_nves` (`id`);

--
-- Restrições para tabelas `representantes`
--
ALTER TABLE `representantes`
  ADD CONSTRAINT `representantes_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `representantes_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `representante_empresas`
--
ALTER TABLE `representante_empresas`
  ADD CONSTRAINT `representante_empresas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `representante_empresas_representante_id_foreign` FOREIGN KEY (`representante_id`) REFERENCES `representantes` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `sangria_caixas`
--
ALTER TABLE `sangria_caixas`
  ADD CONSTRAINT `sangria_caixas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sangria_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `servicos`
--
ALTER TABLE `servicos`
  ADD CONSTRAINT `servicos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_servicos` (`id`),
  ADD CONSTRAINT `servicos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `servico_os`
--
ALTER TABLE `servico_os`
  ADD CONSTRAINT `servico_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`),
  ADD CONSTRAINT `servico_os_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`);

--
-- Restrições para tabelas `sub_categorias`
--
ALTER TABLE `sub_categorias`
  ADD CONSTRAINT `sub_categorias_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `sub_categoria_ecommerces`
--
ALTER TABLE `sub_categoria_ecommerces`
  ADD CONSTRAINT `sub_categoria_ecommerces_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_produto_ecommerces` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `suprimento_caixas`
--
ALTER TABLE `suprimento_caixas`
  ADD CONSTRAINT `suprimento_caixas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `suprimento_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `tamanho_pizzas`
--
ALTER TABLE `tamanho_pizzas`
  ADD CONSTRAINT `tamanho_pizzas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tela_pedidos`
--
ALTER TABLE `tela_pedidos`
  ADD CONSTRAINT `tela_pedidos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tema_usuarios`
--
ALTER TABLE `tema_usuarios`
  ADD CONSTRAINT `tema_usuarios_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `ticket_mensagems`
--
ALTER TABLE `ticket_mensagems`
  ADD CONSTRAINT `ticket_mensagems_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_mensagems_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `token_cliente_deliveries`
--
ALTER TABLE `token_cliente_deliveries`
  ADD CONSTRAINT `token_cliente_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `token_webs`
--
ALTER TABLE `token_webs`
  ADD CONSTRAINT `token_webs_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `transportadoras`
--
ALTER TABLE `transportadoras`
  ADD CONSTRAINT `transportadoras_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transportadoras_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tributacaos`
--
ALTER TABLE `tributacaos`
  ADD CONSTRAINT `tributacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tributacao_ufs`
--
ALTER TABLE `tributacao_ufs`
  ADD CONSTRAINT `tributacao_ufs_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `troca_vendas`
--
ALTER TABLE `troca_vendas`
  ADD CONSTRAINT `troca_vendas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `troca_vendas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `troca_vendas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `troca_venda_caixas`
--
ALTER TABLE `troca_venda_caixas`
  ADD CONSTRAINT `troca_venda_caixas_antiga_venda_caixas_id_foreign` FOREIGN KEY (`antiga_venda_caixas_id`) REFERENCES `venda_caixas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `troca_venda_caixas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `troca_venda_caixas_nova_venda_caixas_id_foreign` FOREIGN KEY (`nova_venda_caixas_id`) REFERENCES `venda_caixas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `troca_venda_items`
--
ALTER TABLE `troca_venda_items`
  ADD CONSTRAINT `troca_venda_items_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `troca_venda_items_troca_id_foreign` FOREIGN KEY (`troca_id`) REFERENCES `troca_vendas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `unidade_cargas`
--
ALTER TABLE `unidade_cargas`
  ADD CONSTRAINT `unidade_cargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuario_acessos`
--
ALTER TABLE `usuario_acessos`
  ADD CONSTRAINT `usuario_acessos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `vale_pedagios`
--
ALTER TABLE `vale_pedagios`
  ADD CONSTRAINT `vale_pedagios_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `veiculos`
--
ALTER TABLE `veiculos`
  ADD CONSTRAINT `veiculos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `vendas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendas_filial_id_foreign` FOREIGN KEY (`filial_id`) REFERENCES `filials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendas_frete_id_foreign` FOREIGN KEY (`frete_id`) REFERENCES `fretes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendas_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  ADD CONSTRAINT `vendas_transportadora_id_foreign` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `venda_caixas`
--
ALTER TABLE `venda_caixas`
  ADD CONSTRAINT `venda_caixas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `venda_caixas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `venda_caixas_filial_id_foreign` FOREIGN KEY (`filial_id`) REFERENCES `filials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `venda_caixas_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  ADD CONSTRAINT `venda_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `venda_caixa_pre_vendas`
--
ALTER TABLE `venda_caixa_pre_vendas`
  ADD CONSTRAINT `venda_caixa_pre_vendas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `venda_caixa_pre_vendas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `venda_caixa_pre_vendas_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`),
  ADD CONSTRAINT `venda_caixa_pre_vendas_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  ADD CONSTRAINT `venda_caixa_pre_vendas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `xml_enviados`
--
ALTER TABLE `xml_enviados`
  ADD CONSTRAINT `xml_enviados_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
