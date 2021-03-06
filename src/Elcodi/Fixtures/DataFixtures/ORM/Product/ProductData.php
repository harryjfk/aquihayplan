<?php

/*
 * This file is part of the Elcodi package.
 *
 * Copyright (c) 2014-2016 Elcodi.com
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * Feel free to edit as you please, and have fun.
 *
 * @author Marc Morera <yuhu@mmoreram.com>
 * @author Aldo Chiecchia <zimage@tiscali.it>
 * @author Elcodi Team <tech@elcodi.com>
 */

namespace Elcodi\Fixtures\DataFixtures\ORM\Product;

use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

use Elcodi\Component\Currency\Entity\Interfaces\CurrencyInterface;
use Elcodi\Component\Currency\Entity\Money;
use Elcodi\Component\EntityTranslator\Services\Interfaces\EntityTranslatorInterface;
use Elcodi\Component\Product\Entity\Interfaces\CategoryInterface;
use Elcodi\Component\Product\Entity\Interfaces\ProductInterface;
use Elcodi\Fixtures\DataFixtures\ORM\Product\Abstracts\AbstractPurchasableData;

/**
 * Class ProductData
 */
class ProductData extends AbstractPurchasableData implements DependentFixtureInterface
{

    /**
     * Load data fixtures with the passed EntityManager
     *
     * @param ObjectManager $manager
     */
    public function load(ObjectManager $manager)
    {
        /**
         * @var CategoryInterface         $menCategory
         * @var CategoryInterface         $womenCategory
         * @var CurrencyInterface         $currencyUsd
         * @var CurrencyInterface         $currencyEur
         * @var ObjectManager             $productObjectManager
         * @var EntityTranslatorInterface $entityTranslator
         */
        $productFactory = $this->getFactory('product');
        $variantFactory = $this->getFactory('product_variant');
        $menCategory = $this->getReference('category-men');
        $womenCategory = $this->getReference('category-women');
        $currencyUsd = $this->getReference('currency-USD');
        $currencyEur = $this->getReference('currency-EUR');
        $productObjectManager = $this->get('elcodi.object_manager.product');
        $entityTranslator = $this->get('elcodi.entity_translator');

        /**
         * Ibiza Lips
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $product
            ->setName('Ibiza Lips English')
            ->setSlug('ibiza-lips-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('Ibiza Lips English')
            ->setMetaDescription('Ibiza Lips English')
            ->setMetaKeywords('Ibiza Lips English')
            ->addCategory($womenCategory)
            ->setPrincipalCategory($womenCategory)
            ->setShowInHome(true)
            ->setStock(10000)
            ->setPrice(Money::create(799, $currencyUsd))
            ->setEnabled(true);

        $variantWhiteSmall = $variantFactory->create();
        $variantWhiteSmall
            ->setProduct($product)
            ->setStock(10000)
            ->setPrice(Money::create(1099, $currencyUsd))
            ->addOption($this->getReference('value-size-small'))
            ->addOption($this->getReference('value-color-white'))
            ->setEnabled(true);

        $variantBlackSmall = $variantFactory->create();
        $variantBlackSmall
            ->setProduct($product)
            ->setStock(10000)
            ->setPrice(Money::create(1199, $currencyUsd))
            ->addOption($this->getReference('value-size-small'))
            ->addOption($this->getReference('value-color-black'))
            ->setEnabled(true);

        $variantWhiteMedium = $variantFactory->create();
        $variantWhiteMedium
            ->setProduct($product)
            ->setStock(10000)
            ->setPrice(Money::create(1299, $currencyUsd))
            ->addOption($this->getReference('value-size-medium'))
            ->addOption($this->getReference('value-color-white'))
            ->setEnabled(true);

        $variantBlackMedium = $variantFactory->create();
        $variantBlackMedium
            ->setProduct($product)
            ->setStock(10000)
            ->setPrice(Money::create(1399, $currencyUsd))
            ->addOption($this->getReference('value-size-medium'))
            ->addOption($this->getReference('value-color-black'))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $productObjectManager->persist($variantWhiteSmall);
        $productObjectManager->persist($variantWhiteMedium);
        $productObjectManager->persist($variantBlackSmall);
        $productObjectManager->persist($variantBlackMedium);

        $this->addReference('product-ibiza-lips', $product);
        $this->addReference('variant-ibiza-lips-white-small', $variantWhiteSmall);
        $this->addReference('variant-ibiza-lips-black-small', $variantBlackSmall);
        $this->addReference('variant-ibiza-lips-white-medium', $variantWhiteMedium);
        $this->addReference('variant-ibiza-lips-black-medium', $variantBlackMedium);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'Ibiza Lips English',
                'slug'            => 'ibiza-lips-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Ibiza Lips English',
                'metaDescription' => 'Ibiza Lips English',
                'metaKeywords'    => 'Ibiza Lips English',
            ],
            'es' => [
                'name'            => 'Ibiza Lips Spanish',
                'slug'            => 'ibiza-lips-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Ibiza Lips Spanish',
                'metaDescription' => 'Ibiza Lips Spanish',
                'metaKeywords'    => 'Ibiza Lips Spanish',
            ],
            'fr' => [
                'name'            => 'Ibiza Lips Fran??ais',
                'slug'            => 'ibiza-lips-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Ibiza Lips Fran??ais',
                'metaDescription' => 'Ibiza Lips Fran??ais',
                'metaKeywords'    => 'Ibiza Lips Fran??ais',
            ],
            'ca' => [
                'name'            => 'Ibiza Lips Catal??',
                'slug'            => 'ibiza-lips-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Ibiza Lips Catal??',
                'metaDescription' => 'Ibiza Lips Catal??',
                'metaKeywords'    => 'Ibiza Lips Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-1.jpg'
        );

        /**
         * Ibiza Banana
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $product
            ->setName('Ibiza Banana English')
            ->setSlug('ibiza-banana-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('Ibiza Banana English')
            ->setMetaDescription('Ibiza Banana English')
            ->setMetaKeywords('Ibiza Banana English')
            ->setShowInHome(true)
            ->addCategory($womenCategory)
            ->setPrincipalCategory($womenCategory)
            ->setStock(10000)
            ->setPrice(Money::create(399, $currencyEur))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $this->addReference('product-ibiza-banana', $product);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'Ibiza Banana English',
                'slug'            => 'ibiza-banana-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Ibiza Banana English',
                'metaDescription' => 'Ibiza Banana English',
                'metaKeywords'    => 'Ibiza Banana English',
            ],
            'es' => [
                'name'            => 'Ibiza Banana Spanish',
                'slug'            => 'ibiza-banana-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Ibiza Banana Spanish',
                'metaDescription' => 'Ibiza Banana Spanish',
                'metaKeywords'    => 'Ibiza Banana Spanish',
            ],
            'fr' => [
                'name'            => 'Ibiza Banana Fran??ais',
                'slug'            => 'ibiza-banana-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Ibiza Banana Fran??ais',
                'metaDescription' => 'Ibiza Banana Fran??ais',
                'metaKeywords'    => 'Ibiza Banana Fran??ais',
            ],
            'ca' => [
                'name'            => 'Ibiza Banana Catal??',
                'slug'            => 'ibiza-banana-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Ibiza Banana Catal??',
                'metaDescription' => 'Ibiza Banana Catal??',
                'metaKeywords'    => 'Ibiza Banana Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-2.jpg'
        );

        /**
         * I Was There
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $product
            ->setName('I Was There English')
            ->setSlug('i-was-there-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('I Was There English')
            ->setMetaDescription('I Was There English')
            ->setMetaKeywords('I Was There English')
            ->setShowInHome(true)
            ->setShowInHome(true)
            ->addCategory($womenCategory)
            ->setPrincipalCategory($womenCategory)
            ->setStock(10000)
            ->setPrice(Money::create(2105, $currencyUsd))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $this->addReference('product-i-was-there', $product);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'I Was There English',
                'slug'            => 'i-was-there-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'I Was There English',
                'metaDescription' => 'I Was There English',
                'metaKeywords'    => 'I Was There English',
            ],
            'es' => [
                'name'            => 'I Was There Spanish',
                'slug'            => 'i-was-there-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'I Was There Spanish',
                'metaDescription' => 'I Was There Spanish',
                'metaKeywords'    => 'I Was There Spanish',
            ],
            'fr' => [
                'name'            => 'I Was There Fran??ais',
                'slug'            => 'i-was-there-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'I Was There Fran??ais',
                'metaDescription' => 'I Was There Fran??ais',
                'metaKeywords'    => 'I Was There Fran??ais',
            ],
            'ca' => [
                'name'            => 'I Was There Catal??',
                'slug'            => 'i-was-there-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'I Was There Catal??',
                'metaDescription' => 'I Was There Catal??',
                'metaKeywords'    => 'I Was There Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-3.jpg'
        );

        /**
         * A Life Style
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $product
            ->setName('A Life Style English')
            ->setSlug('a-life-style-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('A Life Style English')
            ->setMetaDescription('A Life Style English')
            ->setMetaKeywords('A Life Style English')
            ->setShowInHome(true)
            ->setShowInHome(true)
            ->addCategory($womenCategory)
            ->setPrincipalCategory($womenCategory)
            ->setStock(10000)
            ->setPrice(Money::create(1290, $currencyUsd))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $this->addReference('product-a-life-style', $product);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'A Life Style English',
                'slug'            => 'a-life-style-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'A Life Style English',
                'metaDescription' => 'A Life Style English',
                'metaKeywords'    => 'A Life Style English',
            ],
            'es' => [
                'name'            => 'A Life Style Spanish',
                'slug'            => 'a-life-style-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'A Life Style Spanish',
                'metaDescription' => 'A Life Style Spanish',
                'metaKeywords'    => 'A Life Style Spanish',
            ],
            'fr' => [
                'name'            => 'A Life Style Fran??ais',
                'slug'            => 'a-life-style-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'A Life Style Fran??ais',
                'metaDescription' => 'A Life Style Fran??ais',
                'metaKeywords'    => 'A Life Style Fran??ais',
            ],
            'ca' => [
                'name'            => 'A Life Style Catal??',
                'slug'            => 'a-life-style-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'A Life Style Catal??',
                'metaDescription' => 'A Life Style Catal??',
                'metaKeywords'    => 'A Life Style Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-4.jpg'
        );

        /**
         * A.M. Nesia Ibiza
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $product
            ->setName('A.M. Nesia Ibiza English')
            ->setSlug('a-m-nesia-ibiza-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('A.M. Nesia Ibiza English')
            ->setMetaDescription('A.M. Nesia Ibiza English')
            ->setMetaKeywords('A.M. Nesia Ibiza English')
            ->setShowInHome(true)
            ->setShowInHome(true)
            ->addCategory($womenCategory)
            ->setPrincipalCategory($womenCategory)
            ->setStock(10000)
            ->setPrice(Money::create(1190, $currencyUsd))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $this->addReference('product-a-m-nesia-ibiza', $product);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'A.M. Nesia Ibiza English',
                'slug'            => 'a-m-nesia-ibiza-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'A.M. Nesia Ibiza English',
                'metaDescription' => 'A.M. Nesia Ibiza English',
                'metaKeywords'    => 'A.M. Nesia Ibiza English',
            ],
            'es' => [
                'name'            => 'A.M. Nesia Ibiza Spanish',
                'slug'            => 'a-m-nesia-ibiza-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'A.M. Nesia Ibiza Spanish',
                'metaDescription' => 'A.M. Nesia Ibiza Spanish',
                'metaKeywords'    => 'A.M. Nesia Ibiza Spanish',
            ],
            'fr' => [
                'name'            => 'A.M. Nesia Ibiza Fran??ais',
                'slug'            => 'a-m-nesia-ibiza-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'A.M. Nesia Ibiza Fran??ais',
                'metaDescription' => 'A.M. Nesia Ibiza Fran??ais',
                'metaKeywords'    => 'A.M. Nesia Ibiza Fran??ais',
            ],
            'ca' => [
                'name'            => 'A.M. Nesia Ibiza Catal??',
                'slug'            => 'a-m-nesia-ibiza-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'A.M. Nesia Ibiza Catal??',
                'metaDescription' => 'A.M. Nesia Ibiza Catal??',
                'metaKeywords'    => 'A.M. Nesia Ibiza Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-5.jpg'
        );

        /**
         * Amnesia poem
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $product
            ->setName('Amnesia Poem English')
            ->setSlug('amnesia-poem-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('Amnesia Poem English')
            ->setMetaDescription('Amnesia Poem English')
            ->setMetaKeywords('Amnesia Poem English')
            ->setShowInHome(true)
            ->setShowInHome(true)
            ->addCategory($womenCategory)
            ->setPrincipalCategory($womenCategory)
            ->setStock(10000)
            ->setPrice(Money::create(1390, $currencyUsd))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $this->addReference('product-amnesia-poem', $product);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'Amnesia Poem English',
                'slug'            => 'amnesia-poem-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Amnesia Poem English',
                'metaDescription' => 'Amnesia Poem English',
                'metaKeywords'    => 'Amnesia Poem English',
            ],
            'es' => [
                'name'            => 'Amnesia Poem Spanish',
                'slug'            => 'amnesia-poem-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Amnesia Poem Spanish',
                'metaDescription' => 'Amnesia Poem Spanish',
                'metaKeywords'    => 'Amnesia Poem Spanish',
            ],
            'fr' => [
                'name'            => 'Amnesia Poem Fran??ais',
                'slug'            => 'amnesia-poem-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Amnesia Poem Fran??ais',
                'metaDescription' => 'Amnesia Poem Fran??ais',
                'metaKeywords'    => 'Amnesia Poem Fran??ais',
            ],
            'ca' => [
                'name'            => 'Amnesia Poem Catal??',
                'slug'            => 'amnesia-poem-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Amnesia Poem Catal??',
                'metaDescription' => 'Amnesia Poem Catal??',
                'metaKeywords'    => 'Amnesia Poem Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-6.jpg'
        );

        /**
         * Pyramid
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $product
            ->setName('Pyramid English')
            ->setSlug('pyramid-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('Pyramid English')
            ->setMetaDescription('Pyramid English')
            ->setMetaKeywords('Pyramid English')
            ->setShowInHome(true)
            ->setShowInHome(true)
            ->addCategory($womenCategory)
            ->setPrincipalCategory($womenCategory)
            ->setStock(10000)
            ->setPrice(Money::create(1090, $currencyUsd))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $this->addReference('product-pyramid', $product);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'Pyramid English',
                'slug'            => 'pyramid-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Pyramid English',
                'metaDescription' => 'Pyramid English',
                'metaKeywords'    => 'Pyramid English',
            ],
            'es' => [
                'name'            => 'Pyramid Spanish',
                'slug'            => 'pyramid-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Pyramid Spanish',
                'metaDescription' => 'Pyramid Spanish',
                'metaKeywords'    => 'Pyramid Spanish',
            ],
            'fr' => [
                'name'            => 'Pyramid Fran??ais',
                'slug'            => 'pyramid-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Pyramid Fran??ais',
                'metaDescription' => 'Pyramid Fran??ais',
                'metaKeywords'    => 'Pyramid Fran??ais',
            ],
            'ca' => [
                'name'            => 'Pyramid Catal??',
                'slug'            => 'pyramid-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Pyramid Catal??',
                'metaDescription' => 'Pyramid Catal??',
                'metaKeywords'    => 'Pyramid Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-7.jpg'
        );

        /**
         * Amnesia pink
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $product
            ->setName('Amnesia Pink English')
            ->setSlug('amnesia-pink-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('Amnesia Pink English')
            ->setMetaDescription('Amnesia Pink English')
            ->setMetaKeywords('Amnesia Pink English')
            ->setShowInHome(true)
            ->setShowInHome(true)
            ->addCategory($womenCategory)
            ->setPrincipalCategory($womenCategory)
            ->setStock(10000)
            ->setPrice(Money::create(1290, $currencyUsd))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $this->addReference('product-amnesia-pink', $product);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'Amnesia Pink English',
                'slug'            => 'amnesia-pink-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Amnesia Pink English',
                'metaDescription' => 'Amnesia Pink English',
                'metaKeywords'    => 'Amnesia Pink English',
            ],
            'es' => [
                'name'            => 'Amnesia Pink Spanish',
                'slug'            => 'amnesia-pink-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Amnesia Pink Spanish',
                'metaDescription' => 'Amnesia Pink Spanish',
                'metaKeywords'    => 'Amnesia Pink Spanish',
            ],
            'fr' => [
                'name'            => 'Amnesia Pink Fran??ais',
                'slug'            => 'amnesia-pink-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Amnesia Pink Fran??ais',
                'metaDescription' => 'Amnesia Pink Fran??ais',
                'metaKeywords'    => 'Amnesia Pink Fran??ais',
            ],
            'ca' => [
                'name'            => 'Amnesia Pink Catal??',
                'slug'            => 'amnesia-pink-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Amnesia Pink Catal??',
                'metaDescription' => 'Amnesia Pink Catal??',
                'metaKeywords'    => 'Amnesia Pink Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-8.jpg'
        );

        /**
         * Pinky fragments
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $product
            ->setName('Pinky Fragments English')
            ->setSlug('pinky-fragments-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('Pinky Fragments English')
            ->setMetaDescription('Pinky Fragments English')
            ->setMetaKeywords('Pinky Fragments English')
            ->setShowInHome(true)
            ->setShowInHome(true)
            ->addCategory($womenCategory)
            ->setPrincipalCategory($womenCategory)
            ->setStock(10000)
            ->setPrice(Money::create(1190, $currencyUsd))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $this->addReference('product-pinky-fragments', $product);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'Pinky Fragments English',
                'slug'            => 'pinky-fragments-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Pinky Fragments English',
                'metaDescription' => 'Pinky Fragments English',
                'metaKeywords'    => 'Pinky Fragments English',
            ],
            'es' => [
                'name'            => 'Pinky Fragments Spanish',
                'slug'            => 'pinky-fragments-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Pinky Fragments Spanish',
                'metaDescription' => 'Pinky Fragments Spanish',
                'metaKeywords'    => 'Pinky Fragments Spanish',
            ],
            'fr' => [
                'name'            => 'Pinky Fragments Fran??ais',
                'slug'            => 'pinky-fragments-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Pinky Fragments Fran??ais',
                'metaDescription' => 'Pinky Fragments Fran??ais',
                'metaKeywords'    => 'Pinky Fragments Fran??ais',
            ],
            'ca' => [
                'name'            => 'Pinky Fragments Catal??',
                'slug'            => 'pinky-fragments-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Pinky Fragments Catal??',
                'metaDescription' => 'Pinky Fragments Catal??',
                'metaKeywords'    => 'Pinky Fragments Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-9.jpg'
        );

        /**
         * I Was There II
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $product
            ->setName('I was there II English')
            ->setSlug('i-was-there-ii-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('I was there II English')
            ->setMetaDescription('I was there II English')
            ->setMetaKeywords('I was there II English')
            ->setShowInHome(true)
            ->setShowInHome(true)
            ->addCategory($menCategory)
            ->setPrincipalCategory($menCategory)
            ->setStock(10000)
            ->setPrice(Money::create(1190, $currencyUsd))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $this->addReference('product-i-was-there-ii', $product);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'I was there II English',
                'slug'            => 'i-was-there-ii-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'I was there II English',
                'metaDescription' => 'I was there II English',
                'metaKeywords'    => 'I was there II English',
            ],
            'es' => [
                'name'            => 'I was there II Spanish',
                'slug'            => 'i-was-there-ii-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'I was there II Spanish',
                'metaDescription' => 'I was there II Spanish',
                'metaKeywords'    => 'I was there II Spanish',
            ],
            'fr' => [
                'name'            => 'I was there II Fran??ais',
                'slug'            => 'i-was-there-ii-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'I was there II Fran??ais',
                'metaDescription' => 'I was there II Fran??ais',
                'metaKeywords'    => 'I was there II Fran??ais',
            ],
            'ca' => [
                'name'            => 'I was there II Catal??',
                'slug'            => 'i-was-there-ii-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'I was there II Catal??',
                'metaDescription' => 'I was there II Catal??',
                'metaKeywords'    => 'I was there II Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-10.jpg'
        );

        /**
         * Amnesia
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $product
            ->setName('Amnesia English')
            ->setSlug('amnesia-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('Amnesia English')
            ->setMetaDescription('Amnesia English')
            ->setMetaKeywords('Amnesia English')
            ->setShowInHome(true)
            ->setShowInHome(true)
            ->addCategory($menCategory)
            ->setPrincipalCategory($menCategory)
            ->setStock(10000)
            ->setPrice(Money::create(1800, $currencyUsd))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $this->addReference('product-amnesia', $product);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'Amnesia English',
                'slug'            => 'amnesia-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Amnesia English',
                'metaDescription' => 'Amnesia English',
                'metaKeywords'    => 'Amnesia English',
            ],
            'es' => [
                'name'            => 'Amnesia Spanish',
                'slug'            => 'amnesia-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Amnesia Spanish',
                'metaDescription' => 'Amnesia Spanish',
                'metaKeywords'    => 'Amnesia Spanish',
            ],
            'fr' => [
                'name'            => 'Amnesia Fran??ais',
                'slug'            => 'amnesia-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Amnesia Fran??ais',
                'metaDescription' => 'Amnesia Fran??ais',
                'metaKeywords'    => 'Amnesia Fran??ais',
            ],
            'ca' => [
                'name'            => 'Amnesia Catal??',
                'slug'            => 'amnesia-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Amnesia Catal??',
                'metaDescription' => 'Amnesia Catal??',
                'metaKeywords'    => 'Amnesia Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-11.jpg'
        );

        /**
         * Amnesia 100%
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $product
            ->setName('Amnesia 100% English')
            ->setSlug('amnesia-100-percent-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('Amnesia 100% English')
            ->setMetaDescription('Amnesia 100% English')
            ->setMetaKeywords('Amnesia 100% English')
            ->setShowInHome(true)
            ->setShowInHome(true)
            ->addCategory($menCategory)
            ->setPrincipalCategory($menCategory)
            ->setStock(10000)
            ->setPrice(Money::create(1650, $currencyUsd))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $this->addReference('product-amnesia-100-percent', $product);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'Amnesia 100% English',
                'slug'            => 'amnesia-100-percent-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Amnesia 100% English',
                'metaDescription' => 'Amnesia 100% English',
                'metaKeywords'    => 'Amnesia 100% English',
            ],
            'es' => [
                'name'            => 'Amnesia 100% Spanish',
                'slug'            => 'amnesia-100-percent-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Amnesia 100% Spanish',
                'metaDescription' => 'Amnesia 100% Spanish',
                'metaKeywords'    => 'Amnesia 100% Spanish',
            ],
            'fr' => [
                'name'            => 'Amnesia 100% Fran??ais',
                'slug'            => 'amnesia-100-percent-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Amnesia 100% Fran??ais',
                'metaDescription' => 'Amnesia 100% Fran??ais',
                'metaKeywords'    => 'Amnesia 100% Fran??ais',
            ],
            'ca' => [
                'name'            => 'Amnesia 100% Catal??',
                'slug'            => 'amnesia-100-percent-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Amnesia 100% Catal??',
                'metaDescription' => 'Amnesia 100% Catal??',
                'metaKeywords'    => 'Amnesia 100% Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-12.jpg'
        );

        /**
         * A life style
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $product
            ->setName('A life style II English')
            ->setSlug('a-life-style-ii-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('A life style II English')
            ->setMetaDescription('A life style II English')
            ->setMetaKeywords('A life style II English')
            ->setShowInHome(true)
            ->setShowInHome(true)
            ->addCategory($menCategory)
            ->setPrincipalCategory($menCategory)
            ->setStock(10000)
            ->setPrice(Money::create(1550, $currencyUsd))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $this->addReference('product-a-life-style-ii', $product);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'A life style II English',
                'slug'            => 'a-life-style-ii-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'A life style II English',
                'metaDescription' => 'A life style II English',
                'metaKeywords'    => 'A life style II English',
            ],
            'es' => [
                'name'            => 'A life style II Spanish',
                'slug'            => 'a-life-style-ii-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'A life style II Spanish',
                'metaDescription' => 'A life style II Spanish',
                'metaKeywords'    => 'A life style II Spanish',
            ],
            'fr' => [
                'name'            => 'A life style II Fran??ais',
                'slug'            => 'a-life-style-ii-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'A life style II Fran??ais',
                'metaDescription' => 'A life style II Fran??ais',
                'metaKeywords'    => 'A life style II Fran??ais',
            ],
            'ca' => [
                'name'            => 'A life style II Catal??',
                'slug'            => 'a-life-style-ii-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'A life style II Catal??',
                'metaDescription' => 'A life style II Catal??',
                'metaKeywords'    => 'A life style II Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-13.jpg'
        );

        /**
         * All night long
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $product
            ->setName('All night long English')
            ->setSlug('all-night-long-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('All night long English')
            ->setMetaDescription('All night long English')
            ->setMetaKeywords('All night long English')
            ->setShowInHome(true)
            ->setShowInHome(true)
            ->addCategory($menCategory)
            ->setPrincipalCategory($menCategory)
            ->setStock(10000)
            ->setPrice(Money::create(1710, $currencyUsd))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $this->addReference('product-all-night-long', $product);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'All night long English',
                'slug'            => 'all-night-long-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'All night long English',
                'metaDescription' => 'All night long English',
                'metaKeywords'    => 'All night long English',
            ],
            'es' => [
                'name'            => 'All night long Spanish',
                'slug'            => 'all-night-long-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'All night long Spanish',
                'metaDescription' => 'All night long Spanish',
                'metaKeywords'    => 'All night long Spanish',
            ],
            'fr' => [
                'name'            => 'All night long Fran??ais',
                'slug'            => 'all-night-long-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'All night long Fran??ais',
                'metaDescription' => 'All night long Fran??ais',
                'metaKeywords'    => 'All night long Fran??ais',
            ],
            'ca' => [
                'name'            => 'All night long Catal??',
                'slug'            => 'all-night-long-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'All night long Catal??',
                'metaDescription' => 'All night long Catal??',
                'metaKeywords'    => 'All night long Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-14.jpg'
        );

        /**
         * A.M. Nesia Ibiza II
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $menCategory = $this->getReference('category-men');
        $product
            ->setName('A.M. Nesia Ibiza II English')
            ->setSlug('a-m-nesia-ibiza-ii-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('A.M. Nesia Ibiza II English')
            ->setMetaDescription('A.M. Nesia Ibiza II English')
            ->setMetaKeywords('A.M. Nesia Ibiza II English')
            ->setShowInHome(true)
            ->setShowInHome(true)
            ->addCategory($menCategory)
            ->setPrincipalCategory($menCategory)
            ->setStock(10000)
            ->setPrice(Money::create(18000, $currencyUsd))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $this->addReference('product-a-m-nesia-ibiza-ii', $product);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'A.M. Nesia Ibiza II English',
                'slug'            => 'a-m-nesia-ibiza-ii-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'A.M. Nesia Ibiza II English',
                'metaDescription' => 'A.M. Nesia Ibiza II English',
                'metaKeywords'    => 'A.M. Nesia Ibiza II English',
            ],
            'es' => [
                'name'            => 'A.M. Nesia Ibiza II Spanish',
                'slug'            => 'a-m-nesia-ibiza-ii-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'A.M. Nesia Ibiza II Spanish',
                'metaDescription' => 'A.M. Nesia Ibiza II Spanish',
                'metaKeywords'    => 'A.M. Nesia Ibiza II Spanish',
            ],
            'fr' => [
                'name'            => 'A.M. Nesia Ibiza II Fran??ais',
                'slug'            => 'a-m-nesia-ibiza-ii-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'A.M. Nesia Ibiza II Fran??ais',
                'metaDescription' => 'A.M. Nesia Ibiza II Fran??ais',
                'metaKeywords'    => 'A.M. Nesia Ibiza II Fran??ais',
            ],
            'ca' => [
                'name'            => 'A.M. Nesia Ibiza II Catal??',
                'slug'            => 'a-m-nesia-ibiza-ii-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'A.M. Nesia Ibiza II Catal??',
                'metaDescription' => 'A.M. Nesia Ibiza II Catal??',
                'metaKeywords'    => 'A.M. Nesia Ibiza II Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-15.jpg'
        );

        /**
         * High Pyramid
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $menCategory = $this->getReference('category-men');
        $product
            ->setName('High Pyramid English')
            ->setSlug('high-pyramid-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('High Pyramid English')
            ->setMetaDescription('High Pyramid English')
            ->setMetaKeywords('High Pyramid English')
            ->setShowInHome(true)
            ->setShowInHome(true)
            ->addCategory($menCategory)
            ->setPrincipalCategory($menCategory)
            ->setStock(10000)
            ->setPrice(Money::create(2000, $currencyUsd))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $this->addReference('product-high-pyramid', $product);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'High Pyramid English',
                'slug'            => 'high-pyramid-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'High Pyramid English',
                'metaDescription' => 'High Pyramid English',
                'metaKeywords'    => 'High Pyramid English',
            ],
            'es' => [
                'name'            => 'High Pyramid Spanish',
                'slug'            => 'high-pyramid-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'High Pyramid Spanish',
                'metaDescription' => 'High Pyramid Spanish',
                'metaKeywords'    => 'High Pyramid Spanish',
            ],
            'fr' => [
                'name'            => 'High Pyramid Fran??ais',
                'slug'            => 'high-pyramid-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'High Pyramid Fran??ais',
                'metaDescription' => 'High Pyramid Fran??ais',
                'metaKeywords'    => 'High Pyramid Fran??ais',
            ],
            'ca' => [
                'name'            => 'High Pyramid Catal??',
                'slug'            => 'high-pyramid-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'High Pyramid Catal??',
                'metaDescription' => 'High Pyramid Catal??',
                'metaKeywords'    => 'High Pyramid Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-16.jpg'
        );

        /**
         * Star Amnesia
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $menCategory = $this->getReference('category-men');
        $product
            ->setName('Star Amnesia English')
            ->setSlug('star-amnesia-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('Star Amnesia English')
            ->setMetaDescription('Star Amnesia English')
            ->setMetaKeywords('Star Amnesia English')
            ->setShowInHome(true)
            ->setShowInHome(true)
            ->addCategory($menCategory)
            ->setPrincipalCategory($menCategory)
            ->setStock(10000)
            ->setPrice(Money::create(1145, $currencyUsd))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $this->addReference('product-star-amnesia', $product);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'Star Amnesia English',
                'slug'            => 'star-amnesia-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Star Amnesia English',
                'metaDescription' => 'Star Amnesia English',
                'metaKeywords'    => 'Star Amnesia English',
            ],
            'es' => [
                'name'            => 'Star Amnesia Spanish',
                'slug'            => 'star-amnesia-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Star Amnesia Spanish',
                'metaDescription' => 'Star Amnesia Spanish',
                'metaKeywords'    => 'Star Amnesia Spanish',
            ],
            'fr' => [
                'name'            => 'Star Amnesia Fran??ais',
                'slug'            => 'star-amnesia-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Star Amnesia Fran??ais',
                'metaDescription' => 'Star Amnesia Fran??ais',
                'metaKeywords'    => 'Star Amnesia Fran??ais',
            ],
            'ca' => [
                'name'            => 'Star Amnesia Catal??',
                'slug'            => 'star-amnesia-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Star Amnesia Catal??',
                'metaDescription' => 'Star Amnesia Catal??',
                'metaKeywords'    => 'Star Amnesia Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-17.jpg'
        );

        /**
         * Ibiza 4 Ever
         *
         * @var ProductInterface $product
         */
        $product = $productFactory->create();
        $product
            ->setName('Ibiza 4 Ever English')
            ->setSlug('ibiza-4-ever-en')
            ->setDescription('Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.')
            ->setMetaTitle('Ibiza 4 Ever English')
            ->setMetaDescription('Ibiza 4 Ever English')
            ->setMetaKeywords('Ibiza 4 Ever English')
            ->setShowInHome(true)
            ->setShowInHome(true)
            ->addCategory($menCategory)
            ->setPrincipalCategory($menCategory)
            ->setStock(10000)
            ->setPrice(Money::create(1020, $currencyUsd))
            ->setEnabled(true);

        $productObjectManager->persist($product);
        $this->addReference('product-ibiza-4-ever', $product);
        $productObjectManager->flush($product);

        $entityTranslator->save($product, [
            'en' => [
                'name'            => 'Ibiza 4 Ever English',
                'slug'            => 'ibiza-4-ever-en',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Ibiza 4 Ever English',
                'metaDescription' => 'Ibiza 4 Ever English',
                'metaKeywords'    => 'Ibiza 4 Ever English',
            ],
            'es' => [
                'name'            => 'Ibiza 4 Ever Spanish',
                'slug'            => 'ibiza-4-ever-es',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Ibiza 4 Ever Spanish',
                'metaDescription' => 'Ibiza 4 Ever Spanish',
                'metaKeywords'    => 'Ibiza 4 Ever Spanish',
            ],
            'fr' => [
                'name'            => 'Ibiza 4 Ever Fran??ais',
                'slug'            => 'ibiza-4-ever-fr',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Ibiza 4 Ever Fran??ais',
                'metaDescription' => 'Ibiza 4 Ever Fran??ais',
                'metaKeywords'    => 'Ibiza 4 Ever Fran??ais',
            ],
            'ca' => [
                'name'            => 'Ibiza 4 Ever Catal??',
                'slug'            => 'ibiza-4-ever-ca',
                'description'     => 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.
                Etiam blandit erat libero. Integer a elit a tortor scelerisque
                bibendum quis eget tortor. Donec vitae tempor tellus.',
                'metaTitle'       => 'Ibiza 4 Ever Catal??',
                'metaDescription' => 'Ibiza 4 Ever Catal??',
                'metaKeywords'    => 'Ibiza 4 Ever Catal??',
            ],
        ]);

        $this->storePurchasableImage(
            $product,
            'product-18.jpg'
        );

        $productObjectManager->flush();
    }

    /**
     * This method must return an array of fixtures classes
     * on which the implementing class depends on
     *
     * @return array
     */
    public function getDependencies()
    {
        return [
            'Elcodi\Fixtures\DataFixtures\ORM\Currency\CurrencyData',
            'Elcodi\Fixtures\DataFixtures\ORM\Category\CategoryData',
            'Elcodi\Fixtures\DataFixtures\ORM\Attribute\AttributeData',
            'Elcodi\Fixtures\DataFixtures\ORM\Store\StoreData',
        ];
    }
}
