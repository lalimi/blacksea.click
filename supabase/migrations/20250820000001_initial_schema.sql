-- Create essential tables from the Rails app schema
-- This is just a starting point, we'll add more tables as needed

-- Active Storage Tables
CREATE TABLE IF NOT EXISTS active_storage_blobs (
  id BIGSERIAL PRIMARY KEY,
  key VARCHAR(191) NOT NULL,
  filename VARCHAR(191) NOT NULL,
  content_type VARCHAR(191),
  metadata TEXT,
  byte_size BIGINT NOT NULL,
  checksum VARCHAR(191),
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  service_name VARCHAR NOT NULL
);

CREATE UNIQUE INDEX IF NOT EXISTS index_active_storage_blobs_on_key ON active_storage_blobs (key);

CREATE TABLE IF NOT EXISTS active_storage_attachments (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(191) NOT NULL,
  record_type VARCHAR(191) NOT NULL,
  record_id BIGINT NOT NULL,
  blob_id BIGINT NOT NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

CREATE INDEX IF NOT EXISTS index_active_storage_attachments_on_blob_id ON active_storage_attachments (blob_id);
CREATE UNIQUE INDEX IF NOT EXISTS index_active_storage_attachments_uniqueness ON active_storage_attachments (record_type, record_id, name, blob_id);

CREATE TABLE IF NOT EXISTS active_storage_variant_records (
  id BIGSERIAL PRIMARY KEY,
  blob_id BIGINT NOT NULL,
  variation_digest VARCHAR NOT NULL
);

CREATE UNIQUE INDEX IF NOT EXISTS index_active_storage_variant_records_uniqueness ON active_storage_variant_records (blob_id, variation_digest);

-- Add foreign key constraints
ALTER TABLE active_storage_attachments
  ADD CONSTRAINT fk_rails_active_storage_attachments_blob
  FOREIGN KEY (blob_id)
  REFERENCES active_storage_blobs (id);

ALTER TABLE active_storage_variant_records
  ADD CONSTRAINT fk_rails_active_storage_variant_records_blob
  FOREIGN KEY (blob_id)
  REFERENCES active_storage_blobs (id);

-- Add email index for existing table (placeholder migration from before)
CREATE INDEX IF NOT EXISTS email_index ON users (email);