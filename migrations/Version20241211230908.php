<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20241211230908 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP SEQUENCE user_roles_id_seq CASCADE');
        $this->addSql('ALTER TABLE user_roles DROP CONSTRAINT fk_54fcd59f38c751c4');
        $this->addSql('ALTER TABLE user_roles DROP CONSTRAINT fk_54fcd59fdb38439e');
        $this->addSql('DROP TABLE user_roles');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('CREATE SEQUENCE user_roles_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE user_roles (id SERIAL NOT NULL, roles_id INT NOT NULL, usuario_id INT NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE UNIQUE INDEX uniq_54fcd59fdb38439e ON user_roles (usuario_id)');
        $this->addSql('CREATE UNIQUE INDEX uniq_54fcd59f38c751c4 ON user_roles (roles_id)');
        $this->addSql('ALTER TABLE user_roles ADD CONSTRAINT fk_54fcd59f38c751c4 FOREIGN KEY (roles_id) REFERENCES roles (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE user_roles ADD CONSTRAINT fk_54fcd59fdb38439e FOREIGN KEY (usuario_id) REFERENCES "user" (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
    }
}
