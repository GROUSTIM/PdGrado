<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20241210205857 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE roles DROP CONSTRAINT fk_b63e2ec7d84ab5c4');
        $this->addSql('DROP INDEX idx_b63e2ec7d84ab5c4');
        $this->addSql('ALTER TABLE roles DROP user_roles_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE roles ADD user_roles_id INT NOT NULL');
        $this->addSql('ALTER TABLE roles ADD CONSTRAINT fk_b63e2ec7d84ab5c4 FOREIGN KEY (user_roles_id) REFERENCES user_roles (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX idx_b63e2ec7d84ab5c4 ON roles (user_roles_id)');
    }
}
